#!/bin/sh
### BEGIN INIT INFO
# Provides:          kibana
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts kibana
# Description:       Kibana 4 init.d script
### END INIT INFO
set -ue

NAME="kibana"
DESC="kibana"

. /lib/lsb/init-functions

PID=/var/run/kibana4.pid

start() {

  start-stop-daemon --start --background --quiet \
                    --pidfile "$PID" --make-pidfile \
                    --startas /bin/bash -- -c "exec /opt/kibana/bin/kibana > /var/log/kibana/kibana.log 2>&1"
}

stop() {
  start-stop-daemon --stop --quiet --pidfile "$PID"
}

case "$1" in
  start)
    echo -n "Starting $DESC: "
    start
    echo "$NAME."
    ;;
  stop)
    echo -n "Stopping $DESC: "
    stop
    echo "$NAME."
    ;;
  restart)
    echo -n "Restarting $DESC: "
    stop
    sleep 1
    start
    echo "$NAME."
    ;;
  status)
    status_of_proc -p "$PID" "$NAME" "$NAME"
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|status}" >&2
    exit 1
    ;;
esac
