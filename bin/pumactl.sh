#!/bin/bash

current_dir=`(cd $(dirname $0); pwd)`
rails_root=`(cd "$current_dir/../"; pwd)`
log_file="$rails_root/log/puma.log"
pid_dir="${rails_root}/tmp/pids"
pid_file="${pid_dir}/puma.pid"

start() {
  echo "starting puma"

  mkdir -p $pid_dir
  cd $rails_root
  bundle exec pumactl start >> $log_file  2>&1 &
}

stop() {
  echo "stopping puma"
  cd $rails_root

  if [ -f $pid_file ]; then
    bundle exec pumactl stop
  else
    echo "pid file not found: $pid_file"
  fi
}

restart() {
  echo "restarting puma"
  stop
  start
}

# See how we were called.
case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    restart
    ;;
  *)
    echo $"Usage: $prog {start|stop|restart}"
esac