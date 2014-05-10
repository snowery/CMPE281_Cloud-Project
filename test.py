__author__ = 'lan'
from host import Host
from billing import Billing
from controller import Controller


class Test:
    def __init__(self):
        self.controller = Controller("root", 'root', "cmpe281")
        self.bill = Billing("root", 'root', "cmpe281")

    def host(self):
#        host = Host('user@host_ip', '/path/.ssh/id_rsa', '/Applications/Genymotion.app/Contents/MacOS/player')
        host = self.controller.get_host("lan@localhost")

        print host.get_instances()
        print host.get_instance_status('Nexus 7 - 4.4.2 - API 19 - 800x1280')
        print host.get_running_instances()

    def controller_add_instances(self):
        host = self.controller.get_host("lan@localhost")
        self.controller.add_instances(host)

    def controller_get_instance_category(self):
        print self.controller.get_instance_category()

    def controller_order(self, vm_name):
        print self.controller.get_idle_instances(vm_name)
        vm = self.controller.get_idle_instances(vm_name)[0]
        self.controller.order_instance(vm, 1, 0, 0.11)

    def controller_poweroff(self, vm_id):
        self.controller.poweroff_instance(vm_id)
        print self.controller.get_instance_status(vm_id)

    def controller_launch(self, vm_id):
        self.controller.launch_instance(vm_id)

    def controller_terminate(self, vm_id):
        self.controller.terminate_instance(vm_id)
        print self.controller.get_instance_status(vm_id)

    def controller_get_instances_by_user(self, user_id):
        print self.controller.get_instance_by_user(user_id)

    def calc_bill(self, user_id):
        print self.bill.calc_bill_by_user(user_id)

    def generate_reports(self):
        self.bill.generate_reports()

    def get_bill_history(self, user_id):
        print self.bill.get_bill_history(user_id)

    def get_instance_by_id(self, vm_id):
        print self.controller.get_instance_by_id(vm_id)

    def pay_bill(self, bill_id):
        self.bill.pay_bill(bill_id)

    def get_log(self, user_id):
        print self.controller.get_log_by_user(user_id)

#Test().controller_order('Galaxy S2 - 4.1.1 - API 16 - 480x800')
#Test().host()
#Test().controller_get_instance_category()
#Test().controller_launch(9)
#Test().controller_poweroff(11)
#Test().controller_terminate(9)
#Test().generate_reports()
#Test().get_bill_history(1)
#Test().calc_bill(1)
#Test().get_instance_by_id(12)
#Test().pay_bill(3)
Test().get_log(1)