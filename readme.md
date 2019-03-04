# How to run container

## Pull cbweb git repository

Inside cbweb_dock directory pull cbweb git repository to folder named project. 

So when you are positioned in cbweb_dock dir run git clone command:
```
git clone git@git.bay42.io:clickbooth/cbweb.git project
```

## Add .env 

After project is located in project folder add .env file to project(cbweb_dock/project/.env will be env path). Copy .env from already working project or make .env from template.

* To get mysql db host call:
```
docker-machine ip
```
command to get you machine ip in docker network.

* For redis host use hostname:
```
redis
```
* For mongo use hostname:
```
mongo
```
* Add wanted domain name to /etc/hosts and put that domain name in env(in .env example below domain name is ```cbweb.site```)

Here is example of one working .env file:
```
APP_ENV=local
APP_DEBUG=false
ADMIN_API_KEY=a3ef5c3e760d1468b2597661eef9ab0e
APP_KEY=IK0VsAvDecavhelQ7biASPcqvvw1jcHm
APP_TIMEZONE=America/New_York
APP_URL=http://login.cbweb.site
METIS_APP_KEY=r9AODygU6lL2aP2qkNqukpb708dAH96H

APP_CLICKBOOTH_URL_INFO=http://login.cbweb.site
APP_ADPERIO_URL_INFO=http://login.adperio.site

APP_DOMAIN=login.cbweb.site
LANDING_PAGE_DOMAIN=cbweb.site

LOG_QUERIES=true
LOG_EXECUTION_STATS=false

LOG_MAX_FILES=10

CLICKBOOTH_HOST=www.cbweb.site

APP_TIMEZONE=America/New_York

REDIS_DB_HOST=redis
REDIS_DB_PORT=6379

DB_HOST=192.168.99.1
DB_DATABASE=cb_phase2_2019
DB_USERNAME=cbuser
DB_PASSWORD=test1234
DB_TIMEZONE=America/New_York

MONGO_DB_HOST=mongo
MONGO_DB_DATABASE=mongo_mysql_transition
#MONGO_DB_DATABASE=smartrlinks_new
MONGO_DB_USERNAME=
MONGO_DB_PASSWORD=

SHARD_HOST_1=localhost:27017
SHARD_DATABASE_NAME_1=cbtest

ADPERIO_MONGO_DB_DATABASE=adperio_pre_imported

MONGO_COMPLIANCE_HOST=mongo
MONGO_COMPLIANCE_DB=compliance_db

MONGO_MEGASTREAM_HOST=mongo
MONGO_MEGASTREAM_DB=megastream

... rest of .env file is like normal

```

## Adjust nginx confs for you needs
In ```nginx_confs``` folder are provided nginx confs that you can adjust or add new one. To current provided confs you just need to change domain names that you use.

## Bring up composed containers

* Start docker.

* After Docker started start docker machine:
```
docker-machine start
```

* After all above finished position your cli to cbweb_dock folder and call:
```
docker-compose up
```
command and wait until it finishes.

## Build project
If containers comaposed build project. Go to project folder and run commands:
```
composer install
gulp build  // install gulp cli
```

## Use site
If all gone as expected site project is live :).

## Usual Errors

Below are some errors with solutions:

* goodbye error: probably nginx conf is not valid or composer. Try:
``` 
gulp build 
compose install
```

* Login view missing(or any other view): 
```
composer install
gulp build
```
