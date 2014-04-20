__author__ = 'lan'
from host import Host
from billing import Billing
from controller import Controller


class Test:
    def __init__(self):
        self.controller = Controller(user="root", db="cmpe281")
        self.bill = Billing(user="root", db="cmpe281")

    def host(self):
        host = Host('user@host_ip', '/path/.ssh/id_rsa', '/Applications/Genymotion.app/Contents/MacOS/player')

        print host.get_instances()
        print host.get_instance_status('Nexus 7 - 4.4.2 - API 19 - 800x1280')
        print host.get_running_instances()

    def controller_add_instances(self):
        host = self.controller.get_host("lan@localhost")
        self.controller.add_instances(host)

    def controller_order(self):
        print self.controller.get_idle_instances('Galaxy S2 - 4.1.1 - API 16 - 480x800')
        vm = self.controller.get_idle_instances('Galaxy S2 - 4.1.1 - API 16 - 480x800')[0]
        self.controller.order_instance(vm, 1, 1, 10)

    def controller_poweroff(self, vm_id):
        self.controller.poweroff_instance(vm_id)
        print self.controller.get_instance_status(vm_id)

    def controller_launch(self, vm_id):
        self.controller.launch_instance(vm_id)

    def controller_terminate(self, vm_id):
        self.controller.terminate_instance(vm_id)
        print self.controller.get_instance_status(vm_id)

    def calc_bill(self, user_id):
        print self.bill.calc_billing(user_id)

Test().calc_bill(1)