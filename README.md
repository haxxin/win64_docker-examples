# win64_docker-examples

First experience with using Docker Desktop on Windows 11 (64-bit)


- [Portainer CE tutorial][10]

## usage

```sh
# one-time setup per host
git clone https://github.com/haxxin/win64_docker-examples.git
cd win64_docker-examples.git

# bootstrap
docker network create proxy
docker volume create portainer-data

# service control
docker compose up -d
docker compose logs # --since=24h
docker compose down
docker compose up -d --force-recreate
```

## reference documents

[10]: https://earthly.dev/blog/portainer-for-docker-container-management/

## scratchpad

*...*

## TODO

- [ ] pyTorch setup
- [ ] *...*
