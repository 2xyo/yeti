#!/bin/bash

PROGNAME=${0##*/} 

usage() 
{ 
  cat <<EOF 
Usage: $PROGNAME 
       $PROGNAME [options] [optional port number, or ipaddr:port]

Create the database tables for yeti who haven't already been created then starts a yeti server.

Django options:
  -v VERBOSITY, --verbosity=VERBOSITY
                        Verbosity level; 0=minimal output, 1=normal output,
                        2=verbose output, 3=very verbose output
  --settings=SETTINGS   The Python path to a settings module, e.g.
                        "myproject.settings.main". If this isn't provided, the
                        DJANGO_SETTINGS_MODULE environment variable will be
                        used.
  --pythonpath=PYTHONPATH
                        A directory to add to the Python path, e.g.
                        "/home/djangoprojects/myproject".
  --traceback           Print traceback on exception
  -6, --ipv6            Tells Django to use a IPv6 address.
  --nothreading         Tells Django to NOT use threading.
  --noreload            Tells Django to NOT use the auto-reloader.
  --nostatic            Tells Django to NOT automatically serve static files
                        at STATIC_URL.
  --insecure            Allows serving static files even if DEBUG is False.
  --version             show program's version number and exit
  -h, --help            show this help message and exit
EOF
} 

ARGS="$@"
while [ $# -gt 0 ]; do
  case "$1" in
    -h|--help)
       usage
       exit
       ;;
    esac
    shift
done


python manage.py syncdb
python manage.py runserver --insecure $ARGS
