# win64_docker-examples

First experience with using Docker Desktop on Windows 11 (64-bit)


- [Portainer CE tutorial][10]

## usage

```sh
# one-time setup per host
git clone https://github.com/haxxin/win64_docker-examples.git
cd win64_docker-examples.git

# bootstrap; one-time
docker network create proxy
docker volume create portainer-data

# project env bootstrap; one-time
cp -av .env.dist .env

# service control
docker compose up -d
docker compose logs # --since=24h
docker compose down
docker compose up -d --force-recreate
```


### hierarchy

- `.env`
- `compose.yml`
- `nginx.conf`
- `mounts/*`

## reference documents

[10]: https://earthly.dev/blog/portainer-for-docker-container-management/

## scratchpad

*...*

## TODO

- [ ] pyTorch setup
- [ ] *...*
