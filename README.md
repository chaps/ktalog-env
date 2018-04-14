

# Init docker containers for development environment

This set of steps raise/create 2 containers binded to the host network
(this will use port 3306 on the host machine for MYSQLd)
and another port for the php local server (e.g. 8080)

The php container uses a docker volume to bind the files from a SCMed project (ktalog-web) dir.

## Requirements:
 - docker
 - patience


## Create custom phpmysqldocker container
`
docker build ./ -t phpmysql
`
or ./createmysqlcontainer.sh


## Obtain an .sql exported DB 
- Go to the current phpmyadmin
- Select the DB to work with
- Select export 

## Edit and define the php variables
### Related vars (at top of the file...):

- LOCAL_DB
- MYSQL_ROOT_PASSWORD
- CONTAINER_NAME

## Create MYSQL container

`./runmysqldocker.sh`

## Edit and define the php variables
### Related vars (at top of the file...):
- DVOLUMEPATH (path to the root of ktalog-web public_html) e.g: /path/to/ktalog-web/public_html 
- SERVERPORT (port to run local php server)
- NAME (name for the container...) 

## Create the PHP container

`./runphpdocker.sh`


## Edit your local php env to connect to the mysql container...
### Related files:
- public_html/js/services/servicePHP.js 
 - Change the `url:` value to match e.g. `127.0.0.1:ValueOfServerPortInRunphpdocker.sh` in lines 14~ and 30~
- public_html/services/config.php
 - Set the mysql_connect values e.g. `("127.0.0.1", "root", "MYSQLROOTPASSWORDsetInRunmysqldocker")`
- public_html/services/globalVariables.php (Verify this...)
 - change domain and folder to localhost:SERVERPORTUSED 

## Run the php server
### Create an interactive session on the container

`docker exec -it phpmysqlcontainername bash

Once in 
```
cd /data 
php -S 0.0.0.0:PORTVALUEUSEDINRunphpdocker 
```

ON the host/dev machine point yer browser into `http://127.0.0.1:PORTVALUE`
This should open up ktalog web



