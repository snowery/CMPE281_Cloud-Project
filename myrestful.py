__author__ = 'Think'
import bottle_mysql
from bottle import template, debug, static_file, url, route, run, install
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
@route('/')
def home():
    return template("", get_url=url)


@route('/dashboard')
def home():
    return template("templates/dashboard", get_url=url)


@route('/instances')
def home():
    instances = myController.get_instance_by_user(1)
    if instances:
        print("instance name = %s", instances[1]['VmName'])
    else:
        print("no instances")
    return template("templates/instances",  get_url=url)


#Static file configure
@route("/login")
def login():
    return static_file("login.html", root="static/html")


@route('/static/<filename:path>')
def static(filename):
    return static_file(filename, root='static')


#db configure
plugin = bottle_mysql.Plugin(dbuser='root', dbpass='root', dbname='amazionstore', dbhost='127.0.0.1', dbport=3306, keyword="mydb")
install(plugin)

#Internal Server
debug(True)
run(reload=True)