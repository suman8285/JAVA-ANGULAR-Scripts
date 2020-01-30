#!/bin/bash
# suman2 start stop status functions\mani
#RED='\033[0;31m'
case "$1" in 
start)
pro=`ps -ef | grep -i suman2.jar | grep -v grep | awk '{print $2} '`
if [ "$pro" == "" ];
then
echo -e " The process is NOT running !! \e[32mstarting now\e[0m"
  export PATH="$PATH:/shared/software/jre1.8.0_161/bin/"
  nohup  java -jar suman2.jar > ./logs/suman2-trace.log &
else
echo -e " The proces is already \e[32mRunning\e[0m" 
fi
   ;;
stop)
fun=`ps -ef | grep -i suman2.jar | grep -v grep | awk '{print $2} '`
if [ "$fun" == "" ];
then
echo -e " The process is already \e[31mStopped\e[0m"
else
    ps -ef | grep -i suman2.jar | grep -v grep | awk '{print $2} ' | xargs kill 
fi
   ;;
restart)
   $0 stop
   $0 start
   ;;
status)
  num=`ps -ef | grep -i suman2.jar | grep -v grep | awk '{print $2} '`
if [ "$num" == "" ];
then 
echo -e " The process is NOT \e[31mRunning\e[0m"
else
echo -e " The Process is \e[32mRunning\e[0m"
fi
   ;;
*)
   echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0 
