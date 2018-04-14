
DVOLUMEPATH=/path/to/ktalog-web/public_html
SERVERPORT=8080
NAME=phpmysqlcontainer

docker run --privileged=true --name $NAME -v $DVOLUMEPATH:/data -it --network=host -p $SERVERPORT:$SERVERPORT -d phpmysql bash




