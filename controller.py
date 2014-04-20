__author__ = 'lan'
import MySQLdb
import datetime
from host import Host


class Controller:
    def __init__(self, user, db):
        self.db = MySQLdb.connect(user=user, db=db)
        self.c = self.db.cursor()

    def add_instances(self, host):
        for vm_name in host.get_instances().iterkeys():
            self.c.execute("insert into instance(VmName, Host) values (%s, %s)", (vm_name, host.get_host()))
            self.db.commit()

    def get_idle_instances(self, vm_name):
        """
        return list of (vm_id, host_string)
        """
        self.c.execute("select VmId, VmName, Host from instance where VmName = %s and ReservedBy is NULL", vm_name)
        result = []
        for row in self.c.fetchall():
            result.append((int(row[0]), row[1], row[2]))
        return result

    def get_host(self, host_string):
        self.c.execute("select * from host where Host = %s", host_string)
        result = self.c.fetchall()[0]
        return Host(result[0], result[1], result[2])

    def get_instance_by_id(self, vm_id):
        self.c.execute("select VmId, VmName, Host from instance where VmId = %s", vm_id)
        return self.c.fetchall()[0]

    def order_instance(self, vm, user_id, plan, rate):
        """
        given (vm_id, vm_name, host_string) and user id, launch instance
        """
        now = datetime.datetime.now().isoformat()
        sql = "insert into orders(UserId, VmId, VmName, VmStatus, Uptime, LastStartTime, RatePlan, UnitPrice, LastBillDate) "+ \
               "values (%s, %s, '%s', '%s', %s, '%s', %s, %s, '%s')" % \
                (user_id, vm[0], vm[1], 'S', 0, now, plan, rate, now)
        self.c.execute(sql)
        self.c.execute("update instance set ReservedBy = %s where VmId = %s", (user_id, vm[0]))
        self.db.commit()
        self.launch_instance(vm[0])

    def launch_instance(self, vm_id):
        now = datetime.datetime.now()
        self.c.execute("update orders set LastStartTime = %s, VmStatus = 'A' where VmId = %s and VmStatus = 'S'", (now, vm_id))
        self.db.commit()
        vm = self.get_instance_by_id(vm_id)
        self.get_host(vm[2]).launch(vm[1])

    def poweroff_instance(self, vm_id):
        vm = self.get_instance_by_id(vm_id)
        self.get_host(vm[2]).poweroff(vm[1])
        now = datetime.datetime.now()
        self.c.execute("select Uptime, LastStartTime from orders where VmId = %s and VmStatus = 'A'", vm_id)
        timestamp = self.c.fetchall()[0]
        uptime = timestamp[0] + (now - timestamp[1]).seconds
        self.c.execute("update orders set Uptime = %s, VmStatus = 'S' where VmId = %s and VmStatus = 'A'", (uptime, vm_id))
        self.db.commit()

    def terminate_instance(self, vm_id):
        if self.get_instance_status(vm_id) != "powered off":
            self.poweroff_instance(vm_id)
        self.c.execute("update instance set ReservedBy = null where VmId = %s", vm_id)
        self.c.execute("update orders set VmStatus = 'T' where VmId = %s and VmStatus = 'S'", (vm_id))
        self.db.commit()

    def get_instance_status(self, vm_id):
        vm = self.get_instance_by_id(vm_id)
        return self.get_host(vm[2]).get_instance_status(vm[1])
