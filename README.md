### How to run this example on Docker?

* Setup Docker on Mac

https://docs.docker.com/installation/mac/

* Install Compose

https://docs.docker.com/compose/install/

* Be sure to run all Docker initial steps first:

```
boot2docker init
boot2docker start
boot2docker shellinit
eval "$(boot2docker shellinit)"
```

* Create the project on Docker container

```
$ docker-compose run web rails new . --force --database=postgresql --skip-bundle
```

* Re-build the project after updating something

```
$ docker-compose build
```

* Setup database for the app

```
$ docker-compose run web rake db:create db:migrate
```

* Boot the app!

```
$ docker-compose up

Recreating hellodocker_db_1...
Recreating hellodocker_web_1...
...
```

* Check it

```
$ boot2docker ip
192.168.59.103

$ open http://192.168.59.103:3000
```
