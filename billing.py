__author__ = 'lan'
import MySQLdb
from MySQLdb import cursors
import datetime


class Billing():
    def __init__(self, user, pwd, db):
        self.db = MySQLdb.connect(user=user, passwd=pwd, db=db)
        self.c = self.db.cursor(cursors.DictCursor)

    def get_orders(self, user_id):
        self.c.execute("select OrderId from orders where UserId = %s and VmStatus <> 'T'", user_id)
        orders = []
        for row in self.c.fetchall():
            orders.append(row['OrderId'])
        return orders

    def calc_bill_by_user(self, user_id):
        report = []
        total = 0.0
        valid_orders = self.get_orders(user_id)
        if len(valid_orders) == 0:
            return [{'total': 0.00}]

        for order_id in valid_orders:
            bill = self.calc_bill_by_id(order_id)
            report.append(bill)
            total += bill["fee"]

        report.append({'total pending': total})
        return report

    def calc_bill_by_id(self, order_id):
        """
        calculate bill for one order
        """
        self.c.execute("select RatePlan, UnitPrice, Uptime, LastStartTime, VmStatus, VmId, LastBillDate, UserId from orders where OrderId = %s", order_id)
        order = self.c.fetchone()
        uptime = order['Uptime']
        now = datetime.datetime.now()
        if order['VmStatus'] == 'A':
            begin = max(order['LastStartTime'], order['LastBillDate'])
            uptime += (now - begin).seconds

        if order['RatePlan'] == 0: # on-demand
            fee = round(float(order['UnitPrice']) * uptime / 60, 2)
        elif order['RatePlan'] == 1: # flat rate
            fee = float(order['UnitPrice'])

        return {'order_id':order_id, 'user_id': int(order['UserId']),'from': str(order['LastBillDate']),
                'to': now.isoformat(' ').split('.')[0], 'plan':int(order['RatePlan']),
                'unit price': float(order['UnitPrice']), 'uptime': int(uptime), 'fee':fee}

    def generate_report_by_id(self, order_id):
        """
        generate reports for one order
        """
        bill = self.calc_bill_by_id(order_id)
        due = datetime.datetime.now() + datetime.timedelta(days=20)
        self.c.execute("insert into billing(OrderId, UserId, StartTime, EndTime, Plan, UnitPrice, Uptime, Charge, DueDate, Status) "+\
                       "values (%s, %s, '%s', '%s', %s, %s, %s, %s, '%s', 'A')" % \
                       (bill['order_id'], bill['user_id'], bill['from'], bill['to'], bill['plan'], bill['unit price'], bill['uptime'], bill['fee'], due))
        self.c.execute("update orders set Uptime = 0, LastBillDate = %s where OrderId = %s", (bill['to'], bill['order_id']))
        self.db.commit()

    def generate_reports(self):
        """
        generate reports for all orders
        """
        self.c.execute("select OrderId from orders where VmStatus <> 'T'")
        for row in self.c.fetchall():
            self.generate_report_by_id(int(row['OrderId']))

    def get_bill_history(self, user_id):
        """
        get billing history by user id
        """
        self.c.execute("select * from billing where UserId = %s", user_id)
        bills = []
        total = 0.0
        for row in self.c.fetchall():
            bill = {'order_id':row['OrderId'], 'user_id': row['UserId'],'from': str(row['StartTime']),
                    'to': str(row['EndTime']), 'plan': row['Plan'], 'unit price': float(row['UnitPrice']),
                    'uptime':row['Uptime'], 'fee': float(row['Charge']), 'status':row['Status']}
            bills.append(bill)
            if bill['status'] == 'A':
                total += bill['fee']

        bills.append({'total unpaid': total})
        return bills

    def pay_bill(self, bill_id):
        self.c.execute("update billing set Status='C', PaidDate=%s where BillId = %s", (datetime.datetime.now(), bill_id))
        self.db.commit()