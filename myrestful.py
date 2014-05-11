__author__ = 'Think'
# import bottle_mysql
from bottle import template, debug, static_file, url, route, run, install, get, post, request, redirect
from beaker.middleware import SessionMiddleware
import webbrowser
import bottle
import controller
import billing

session_opts = {
    'session.type': 'file',
    'session.cookie_expires': 300,
    'session.data_dir': './data',
    'session.auto': True
}
app = SessionMiddleware(bottle.app(), session_opts)


myController = controller.Controller("root", "", "cmpe281")
billingDao = billing.Billing("root", "", "cmpe281")

#REST URL Mapping
@get('/')
def home():
    return static_file("landing.html", root="static/html")


@get('/<uid:int>/dashboard')
def dashboard(uid):
    instances = myController.get_instance_by_user(uid)
    total = len(instances)
    running = 0
    for instance in instances:
        if myController.get_instance_status(instance['VmId']) == 'running':
            running += 1

    logs = myController.get_log_by_user(uid)

    return template("templates/dashboard", get_url=url, running=running, total=total, logs=logs)


@get('/<uid:int>/instances')
def instances(uid):
    instances = myController.get_instance_by_uid(uid)
    return template("templates/instances", get_url=url, instances=instances)

@get('/<uid:int>/billing')
def billing(uid):
    bills = billingDao.get_bills_by_user(uid)
    return template("templates/billing", get_url=url, bills=bills)

@get('/<uid:int>/billing_detail/<date>')
def bill_detail(uid, date):
    detail = billingDao.get_paid_bill_detail(uid, date)
    return template("templates/bill_detail", get_url=url, detail=detail)

#################unimplemented#######################
"""
seperated helper function is not working
"""
def helper(uid):
    print uid
    instances = myController.get_instance_by_uid(uid)
    return template("templates/instances", get_url=url, instances=instances)

@post('/login')
def login():
    """
    user log in
    """
    email = request.forms.get('email')
    password = request.forms.get('password')
    uid = myController.sign_in(email,password)
    s = bottle.request.environ.get('beaker.session')
    s['uid'] = uid
    s.save()
 
    if uid != 0:
        #helper(uid)
        instances = myController.get_instance_by_uid(uid)
        return template("templates/instances", get_url=url, instances=instances)
    else:
        print 'error'
    return

@post('/logout')
def logout():
    """
    user log out
    """
    s = bottle.request.environ.get('beaker.session')
    s.delete()
    return static_file("landing.html", root="static/html") 

@post('/<uid:int>/instances/launch')
def launch(uid):

    rate = 0.25
    plan = request.forms.get('plan')
    number = request.forms.get('number')
    vmName = request.forms.get('vmName')
    print(vmName)

    if plan == "1":
        rate = 250

    #for testing
    #vm = myController.get_idle_instances("Nexus 7 - 4.4.2 - API 19 - 800x1280")
    vm = myController.get_idle_instances(vmName)
    #launch multi VMs
    #for i in range(0, int(number)):
    myController.order_instance(vm[0], uid, int(plan), float(rate))
    #redirect("/"+str(uid)+"/instances")


@get('/<uid:int>/instances/<vmid>/terminate')
def terminate(uid, vmid):
    myController.terminate_instance()
    return



@get('/<uid:int>/instances/<vmid>/poweron')
def poweron(uid, vmid):
    myController.launch_instance(vmid)

@get('/<uid:int>/usage')
def usage(uid):
    return template("templates/usage", get_url=url)

###################################################

@route('/static/<filename:path>')
def static(filename):
    return static_file(filename, root='static')


#db configure
# plugin = bottle_mysql.Plugin(dbuser='root', dbpass='root', dbname='amazionstore', dbhost='127.0.0.1', dbport=3306, keyword="mydb")
# install(plugin)

#Internal Server
debug(True)
run(reload=True, app=app)