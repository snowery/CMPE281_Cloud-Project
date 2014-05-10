__author__ = 'Think'
# import bottle_mysql
from bottle import template, debug, static_file, url, route, run, install, get, post
import controller

myController = controller.Controller("root", "111111", "cmpe281")

#REST URL Mapping
@get('/')
def home():
    return static_file("landing.html", root="static/html")


@get('/<uid:int>/dashboard')
def dashboard(uid):
    return template("templates/dashboard", get_url=url)


@get('/<uid:int>/instances')
def instances(uid):
    instances = myController.get_instance_by_user(uid)
    category = myController.get_instance_category()
   # print("List "+category[0])
    return template("templates/instances", get_url=url, instances=instances, ctry=category)

@get('/<uid:int>/billing')
def billing(uid):
    return template("templates/billing", get_url=url)

#################unimplemented#######################

@post('/login')
def login():
    return

@get('/<uid:int>/instances/launch')
def launch(uid):
    myController.order_instance()
    return

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
run(reload=True)