__author__ = 'Think'
# import bottle_mysql
from bottle import template, debug, static_file, url, route, run, install, get, post
import controller

myController = controller.Controller("root", "root", "cmpe281")

@route('/show')
def show(mydb):
    print "in show"
    mydb.execute("SELECT * from user")
    row = mydb.fetchone()
    if row:
        print "success"
        return row
    return "error"


#REST URL Mapping
@get('/')
def home():
    return template("templates/billing", vm="aaaa")


@get('/dashboard')
def dashboard():
    return template("templates/dashboard", get_url=url)


@get('/<uid:int>/instances')
def instances(uid):
    instances = myController.get_instance_by_user(uid)
    return template("templates/instances", get_url=url, instances=instances)

#################unimplemented#######################

@post('/login')
def login():
    return

@get('/<uid:int>/instances/launch')
def launch(uid):
    return

@get('/<uid:int>/instances/<vmid>/terminate')
def terninate(uid, vmid):
    return


@get('/<uid:int>/instances/<vmid>/poweron')
def poweron(uid, vmid):
    return



###################################################

#Static file configure
@route("/login")
def login():
    return static_file("login.html", root="static/html")


@route('/static/<filename:path>')
def static(filename):
    return static_file(filename, root='static')


#db configure
# plugin = bottle_mysql.Plugin(dbuser='root', dbpass='root', dbname='amazionstore', dbhost='127.0.0.1', dbport=3306, keyword="mydb")
# install(plugin)

#Internal Server
debug(True)
run(reload=True)