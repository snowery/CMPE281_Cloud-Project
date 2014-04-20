__author__ = 'lan'
import datetime
from controller import Controller


class Billing(Controller):

    def get_orders(self, user_id):
        self.c.execute("select RatePlan, UnitPrice, Uptime, LastStartTime, VmStatus, VmId, LastBillDate from orders where UserId = %s and VmStatus <> 'T'", user_id)
        return self.c.fetchall()

    def calc_billing(self, user_id):
        report = []
        now = datetime.datetime.now()
        total = 0.0

        for order in self.get_orders(user_id):
            uptime = order[2]
            if order[4] == 'A':
                uptime += (now - order[3]).seconds

            if order[0] == 0: # on-demand
                fee = float(order[1]) * uptime / 60

            elif order[0] == 1: # flat rate
                fee = float(order[1])

            report.append({'vm_id':int(order[5]), 'period': str(order[6])+' ~ '+now.isoformat(' ').split('.')[0], 'plan':int(order[0]), 'unit price': float(order[1]), 'uptime': int(uptime), 'fee':fee})
            total += fee

        report.append({'total': total})
        return report