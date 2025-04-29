---
title:  Win64 Docker Examples
filename: TODO.md
---

# win64_docker-examples

## TODO

- [ ] setup PyTorch
- [x] `.env` was accidentally commited to the master branch -_-
  - we need to run BFG or such to remove all trace of this file for the sake
  of the tutorial
- [x] verify the timestamp of the conversation Michael and I had
  - <https://github.com/haxxin/win64_docker-examples/wiki/R&D#>

- [ ] rename this repository to something more accurately relevant --
**win64_pytorch-examples** perhaps? I shall ponder this for some time before
deciding; I expect by the end of this project, I will have my answer!

- [ ] Enable [systemd unit][10] usage for WSL2
  - This should allow us to automatically enable Docker boot at the time
    of WSL2 subsystem startup -- no more manual invocation of the Docker
    service for us.
  - Update the relevant info within `README.md` once we are done with this
    task.

- [ ] match the modifications made by the nvidia runtime to the system-wide install
back to the docker-desktop runtime
  - `systemctl --user status docker-desktop.service` (rootless; user)
  - `systemctl status docker.service` (system-wide; root)

- [ ] verify that our Docker w/ NVIDIA runtime tests work under tmux
  - `/mnt/fs1/Projects/haxxin/win64_docker-examples.git/tests/nvidia-container-runtime.bash`

### reference documents

[10]: https://learn.microsoft.com/en-us/windows/wsl/systemd

