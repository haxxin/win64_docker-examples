# win64_docker-examples

My very first experience with setting up and using ~Docker Desktop~ Docker in WSL2 on Windows 11 (64-bit). Up until now, I have always done this inside of MacOS and Linux hosts; my primary "Docker host" is a dedicated VM image running a vanilla version of Debian 12 "Bookworm" with a minimal set of packages and optimized with regard for boot time and, of course, debugging via cli.

This *tutorial* begins as a guide for a friend whom is just starting out on his journey with Docker. My primary objective is to explain how the internals of Docker work in regard to the host OS -- this time being `WSL2` -- I like to think of it as `WSL` being the VM image (OS disk) and Windows 10/11 as the hypervisor. So, just two levels, err, three, to logically consider of "indirection'.

Little does he know that indirection (abstraction) is at the source of so many things that we do as software engineers! *...queue clever quote regarding indirection...*

Oh! My friend's objective is to setup a development environment suitable for learning the TensorFlow API. Therefore, a specific `Python3.x` version must be managed within some context (Docker) for `Pytorch` and other dependencies.

An interesting ish challenge for myself with this project shall be determining (on the fly) what versions of the CUDA toolkit to base this on for both of us to experience approximately the same end result.

My workstation GPU is, embarrassingly enough, a NVIDIA GT710 with CUDA 2.x (first gen, basically!) whereas he has a choice between two modern GPUs. My card is on life support and is at `470.x`. Just how far back in time will I have to go to find an API version that *may* support this? Is there even such a version? ... and so on.

I strongly suspect that I will want to stick with the CPU renderer while writing this up and attempt to accomplish my task separately. 

Time shall tell. Wish me luck :-P

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
docker compose up -drun
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
