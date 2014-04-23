__author__ = 'lan'
import MySQLdb
import datetime
from MySQLdb import cursors
from host import Host
from billing import Billing


class Controller:
    def __init__(self, user, pwd, db):
        self.user_name = user
        self.db_name = db
        self.password = pwd
        self.db = MySQLdb.connect(user=user, passwd=pwd, db=db)
        self.c = self.db.cursor(cursors.DictCursor)

    def add_instances(self, host):
        for vm_name in host.get_instances().iterkeys():
            self.c.execute("insert into instance(VmName, Host) values (%s, %s)", (vm_name, host.get_host()))
            self.db.commit()

    def get_instance_category(self):
        """
        return instance category with distinct vm_name
        """
        self.c.execute("select distinct VmName from instance")
        category = []
        for row in self.c.fetchall():
            category.append(row['VmName'])
        return category

    def get_instance_by_user(self, user_id):
        """
        return instances reserved by user id
        """
        self.c.execute("select VmId, VmName, Host from instance where ReservedBy = %s", user_id)
        return self.c.fetchall()

    def get_idle_instances(self, vm_name):
        """
        return a list of unreserved instances by vm_name
        """
        self.c.execute("select VmId, VmName, Host from instance where VmName = %s and ReservedBy is NULL", vm_name)
        return self.c.fetchall()

    def get_host(self, host_string):
        self.c.execute("select * from host where Host = %s", host_string)
        result = self.c.fetchone()
        return Host(result['Host'], result['Key'], result['Player'])

    def get_instance_by_id(self, vm_id):
        self.c.execute("select VmId, VmName, Host from instance where VmId = %s", vm_id)
        return self.c.fetchone()

    def order_instance(self, vm, user_id, plan, rate):
        """
        given (vm_id, vm_name, host_string) and user id, launch instance
        """
        now = datetime.datetime.now().isoformat()
        sql = "insert into orders(UserId, VmId, VmName, VmStatus, Uptime, LastStartTime, RatePlan, UnitPrice, LastBillDate) "+ \
               "values (%s, %s, '%s', '%s', %s, '%s', %s, %s, '%s')" % \
                (user_id, vm['VmId'], vm['VmName'], 'S', 0, now, plan, rate, now)
        self.c.execute(sql)
        self.c.execute("update instance set ReservedBy = %s where VmId = %s", (user_id, vm['VmId']))
        self.db.commit()
        self.launch_instance(vm['VmId'])

    def launch_instance(self, vm_id):
        now = datetime.datetime.now()
        self.c.execute("update orders set LastStartTime = %s, VmStatus = 'A' where VmId = %s and VmStatus = 'S'", (now, vm_id))
        self.db.commit()
        vm = self.get_instance_by_id(vm_id)
        self.get_host(vm['Host']).launch(vm['VmName'])

    def poweroff_instance(self, vm_id):
        vm = self.get_instance_by_id(vm_id)
        self.get_host(vm['Host']).poweroff(vm['VmName'])
        now = datetime.datetime.now()
        self.c.execute("select Uptime, LastStartTime from orders where VmId = %s and VmStatus = 'A'", vm_id)
        timestamp = self.c.fetchone()
        uptime = timestamp['Uptime'] + (now - timestamp['LastStartTime']).seconds
        self.c.execute("update orders set Uptime = %s, VmStatus = 'S' where VmId = %s and VmStatus = 'A'", (uptime, vm_id))
        self.db.commit()

    def terminate_instance(self, vm_id):
        """
        generate the final bill for this order and power off the instance
        """
        if self.get_instance_status(vm_id) != "powered off":
            self.poweroff_instance(vm_id)
        self.c.execute("select OrderId from orders where VmId = %s and VmStatus = 'S'", vm_id)
        order_id = int(self.c.fetchone()['OrderId'])
        Billing(self.user_name, self.password, self.db_name).generate_report_by_id(order_id)

        self.c.execute("update orders set VmStatus = 'T' where OrderId = %s", order_id)
        self.c.execute("update instance set ReservedBy = null where VmId = %s", vm_id)
        self.db.commit()

    def get_instance_status(self, vm_id):
        """
        return instance status: "running" or "powered off"
        """
        vm = self.get_instance_by_id(vm_id)
        return self.get_host(vm['Host']).get_instance_status(vm['VmName'])
