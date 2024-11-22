# skywalking-simple-docker-starter

## Environment 

- Docker
- MySQL

## Step

1. change `/env/.env.xxx` profile's info.
2. create database name is `skywalking` on mysql
3. run root path file `skywalking-run.sh` (use `sh skywalking-run.sh -p active_profile_name -n compose_name`).
4. free these port: 11800/12800/9412/18080
