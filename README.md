## Synopsis

**pgbouncer** is a popular, small connection pooler for Postgresql. This is yet another docker image with pgbouncer, based on alpine.

## Code Example
You can configure it by Environment variables:
```bash
$ docker run -d \
 --name=pgbouncer \
 -e DB_HOST=postgresql.example.com \
 -e DB_USER=admin \
 -e DB_PASSWORD=mypassword \
 brainsam/pgbouncer:latest
```
Or You can mount config file into docker container:
```bash
$ docker run -d \
 --name pgbouncer \
 -v pgbouncer-config-file:/etc/pgbouncer/pgbouncer.ini \
 brainsam/pgbouncer:latest
```

## Installation

```bash
$ docker pull <ECR>/pgbouncer:<VERSION>
```
## Configuration

All configuration parameters of pgbouncer are available both by *--env* (use the same keys in upper case) and by mounting pgbouncer.ini into container.

#### Troubleshooting

```
docker logs <your-pgbouncer-container-name>
```

## Releasing

To release a new image version add a git tag to this repo and run the `docker-pgbouncer` pipeline with TAG parameter set to the created git tag.
