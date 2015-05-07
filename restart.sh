kill -9 $(ps -ef|grep coffee|grep -v grep|awk '{print $2}')
echo killed
nohup coffee bin/www.coffee &
echo -e '\n'restarted &
exit
