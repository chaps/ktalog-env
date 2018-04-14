
# Create mysql container
MYSQL_ROOT_PASSWORD=testpassword12345
LOCAL_DB=Gala.sql
CONTAINER_NAME=mysqltest

docker run -it -p 3306:3306 --name $CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=testpassword12345 --network=host -d mysql 

# Create database
docker ps
docker exec -it mysqltest mysql -u root -p$(echo $MYSQL_ROOT_PASSWORD) -e 'CREATE DATABASE Gala;'
# Import 
# Copy DB export
docker cp $LOCAL_DB mysqltest:/Gala.sql

docker exec mysqltest echo "$MYSQL_ROOT_PASSWORD"

docker exec mysqltest ls -l /Gala.sql
docker exec  mysqltest bash -c "mysql -u root -p$(echo $MYSQL_ROOT_PASSWORD) Gala < /Gala.sql"


