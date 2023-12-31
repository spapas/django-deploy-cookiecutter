from multiprocessing import cpu_count
from os import environ

def max_workers():
    return 2
    #return  cpu_count() -1

bind = ['unix:{{ cookiecutter.__gunicorn_socket }}', ]
chdir = '{{ cookiecutter.__project_path }}/{{ cookiecutter.project_slug }}/'
pidfile = '{{ cookiecutter.__project_path }}/gunicorn.pid'

proc_name = '{{ cookiecutter.project_slug }}'
timeout = 300
workers = max_workers()
# Restart workers every 1000 requests
max_requests = 1000
max_requests_jitter = 10
capture_output = True

errorlog = '{{ cookiecutter.__project_path }}/logs/gunicorn_error.log'
loglevel = 'info'
accesslog = '{{ cookiecutter.__project_path }}/logs/gunicorn_access.log'
access_log_format = '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'
