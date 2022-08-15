# nvidia-edk2-docker
Dockerized build environment for NVIDIA's edkrepo- and mono-based edk2 build system.

From:
- https://github.com/NVIDIA/edk2-nvidia/wiki/Build
- https://github.com/NVIDIA/edk2-nvidia/blob/main/Platform/NVIDIA/Jetson/Build.md

## Setup
1. Pull the container and open a shell

```bash
docker run -v "<local image dir>:/edkrepo/nvidia-uefi/images/" -it makinbacon/nvidia-edk2-docker:main-edk2-stable202205 /bin/bash
```

2. Run the build script

```bash
edk2-nvidia/Platform/NVIDIA/Jetson/build.sh
```
