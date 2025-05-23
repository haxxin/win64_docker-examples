# win64_docker-examples

My very first experience with setting up and using ~Docker Desktop~ Docker in WSL2 on Windows 11 (64-bit). Up until now, I have always done this inside of MacOS and Linux hosts; my primary "Docker host" is a dedicated VM image running a vanilla version of Debian 12 "Bookworm" with a minimal set of packages and optimized with regard for boot time and, of course, debugging via cli.

This *tutorial* begins as a guide for a friend whom is just starting out on his journey with Docker. My primary objective is to explain how the internals of Docker work in regard to the host OS -- this time being `WSL2` -- I like to think of it as `WSL` being the VM image (OS disk) and Windows 10/11 as the hypervisor. So, just two levels, err, three, to logically consider of "indirection'.

My friend's objective is to setup a development environment suitable for learning the TensorFlow API.  Therefore, a specific `Python3.x` version must be managed within some context (Docker) for `Pytorch` and other dependencies. Whereas he has the luxery of using a decent GPU, I am likely going to be stuck with CPU-only rendering, thus this will be reflected in this source tree. 

- [Portainer CE tutorial][10]
- [Project Wiki](https://github.com/haxxin/win64_docker-examples/wiki)

## usage

**NOTE(JEFF):** This guide assumes that you wish to setup this project
as an end-user and not a potential upstream contributor leading back to
this very git repository. Refer to the **contribitor** sub-section
below if you wish to contribute as the usage may vary slightly depending
on your work environment and preferences.

```sh
# cd "$HOME/Projects" or so as you wish
# --recursive implies that this repo makes use of git submodules
git clone --recursive \
    "https://github.com/haxxin/win64_docker-examples" \
win64_docker-examples.git # creation
cd win64_docker-examples.git # project dir
git checkout master # your origin branch
# success! you are now ready to move on to the next
# phase -- dependencies...
```

If you forget or even choose to not pull the git modules now, you can always
opt-in later on by issuing the following anywhere inside this git repository:

```sh
# WARNING(JEFF): You must not have unstaged modifications at the time you issue
# the following. Stash the changes or commit the changes, however you wish. I
# often will switch to a new branch and make the commits there.
git submodule update --init --recursive
git submodule sync
```

### contributor

The only difference here is the choice in the backend you opt to use.
Git has three major backends available by default: git, https and ssh.
All three have access control means (authentication) and which you
choose is mostly a matter of semantics and preference.

You may want to look into the GitHub documentation on git credential
management to better understand the choices herein. If all else fails,
feel free to use the same HTTPS method as shown above and use the web
client features to commit all of your proposed modifications as
**Pull Requests**.

In any case, my preferred means is **SSH** as I already live and breath
SSH keys for a living and this is the easiest method for me to setup
and live with.

```sh
# cd "$HOME/Projects" or so as you wish
# --recursive implies that this repo makes use of git submodules
git clone --recursive \
    "git@github.com:haxxin/win64_docker-examples" \
win64_docker-examples.git # creation
cd win64_docker-examples.git # project dir
git checkout dev # your origin branch to begin from
# success! you are now ready to move on to the next 
# phase -- dependencies...
```

### deps

**WARNING(JEFF):** Please do not try to install the Docker packages from either your distribution nor especially some random site on the net. The official [installation script][90] does a fine job of preparing the environment and getting things set up the best way possible for the end-user to start off with. Anybody whom gains access to your host via the Docker daemon (or one of its containers) automatically gains system privileges. You have been warned!

- [Docker with WSL2][0] at `>= v23.x`; I shall base my instructions off Debian 12 "Bookworm"
  * `sudo apt install -y apt-transport-https ca-certificates curl software-properties-common`

- begin fresh and uninstall existing Docker environment if yours is in question
  - uninstall; Powershell w/ usage of the [Chocolately repositories][99]
    * `choco.exe uninstall docker docker-cli docker-machine docker-engine`
  - uninstall; WSL2
    * `for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done`

- install; WSL2
  * `apt-get update && apt-get install -y curl ca-certificates apt-transport-https ca-certificates curl software-properties-common docker-ce docker-compose`
    - start Docker daemon (every time WSL boots)
        * `sudo /etc/init.d/docker start`
- MS Powershell from MS Store
- text editor; anything with support for ASCII and/or UTF-8 w/ automatic conversion between `\r\n` (Windows) and *nix (`\n`) encodings
  * [vscode][120]
  * vim (my second favorite)
  * Notepad
  * Notepad++
  * Sublime Text 2/3 (my favorite <3)
- `git`
- `curl`

**IMPORTANT(JEFF):** It is strongly advised that you setup a [mount to an ext4 partition][110] however you desire. It is critical that you use a SSD with decent write performance as software development demands quick file I/O. A slow(er) disk will still likely be faster than not bothering with one.   

### installation

```sh
# one-time setup per host
git clone https://github.com/haxxin/win64_docker-examples.git
# NOTE(JEFF): The .git suffix is semantic for me
cd win64_docker-examples.git # win64_docker-examples

# bootstrap; one-time
docker network create proxy
docker volume create portainer-data

# project env bootstrap; one-time
cp -av .env.dist .env
```

### daily operations
 
```sh
# service control
docker compose up -drun
docker compose logs # --since=24h
docker compose down
docker compose up -d --force-recreate
```

### hierarchy

- `.env.dist` -- default environment state for service(s)
  * `.env` -- this is specific to each developer's host and should **NEVER**
  be commited to your git repository under any circumstance!

- `compose.yml` -- Docker compose "template" file for service containers

- `nginx.conf` -- example configuration using nginx as the frontend webserver for our backend 

- `mounts/*` -- bind mount storage; the name can be anything you want, but we must be consistent 

## reference documents

[0]: https://docs.docker.com/engine/install/debian/#install-using-the-repository

1. [pytorch install](https://pytorch.org/get-started/locally/)

2. [CUDA Toolkit](https://developer.nvidia.com/cuda-downloads?target_os=Windows&target_arch=x86_64&target_version=11&target_type=exe_local)

3. [CUDA Toolkit: Installation](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/#meta-packages)

4. [api docs](https://pytorch.org/docs/stable/cuda.html)

[10]: https://earthly.dev/blog/portainer-for-docker-container-management/
[99]: https://chocolatey.org/
[90]: https://get.docker.com/
[100]: https://github.com/KichangKim/DeepDanbooru
[110]: https://learn.microsoft.com/en-us/windows/wsl/wsl2-mount-disk#
[120]: https://wiki.debian.org/VisualStudioCode

## scratchpad

*...*
