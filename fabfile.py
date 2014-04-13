__author__ = 'lan'
from fabric.api import run, env, hide, settings

class Host:
    def __init__(self, host, key_path=""):
        env.hosts = [host]
        env.key_filename = key_path
        env.port = 22
        env.host_string = host

    def exe_cmd(self, cmd):
        with hide('output','running','warnings'), settings(warn_only=True):
            return run(cmd)


#print Host('ubuntu@host_address', '/Users/key.pem').exe_cmd('ifconfig')
print Host('usr@host_address', '/Users/.ssh/id_rsa').exe_cmd('/path/player --vm-name "Custom Tablet 10 - 4.4.2 - API 19 - 1280x800"')

#get PID
#kill parent_pid