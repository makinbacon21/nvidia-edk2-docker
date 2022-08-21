# nvidia-edk2-docker
Dockerized build environment for NVIDIA's edkrepo- and mono-based edk2 build system.

From:
- https://github.com/NVIDIA/edk2-nvidia/wiki/Build
- https://github.com/NVIDIA/edk2-nvidia/blob/main/Platform/NVIDIA/Jetson/Build.md

## Running from Docker Hub
1. Pull the container for desired branch and open a shell

```bash
docker run -v "<local image dir>:/edkrepo/nvidia-uefi/images/" -it makinbacon/nvidia-edk2-docker:<branch> /bin/bash
```

2. Run the build script

```bash
edk2-nvidia/Platform/NVIDIA/Jetson/build.sh
```

## Building
1. Clone the repo

```bash
git clone https://github.com/makinbacon21/nvidia-edk2-docker.git
```

2. Build for desired branch

```bash
docker build -t makinbacon/nvidia-edk2-docker:latest --build-arg BRANCH=<branch> .
```

3. Run the container

```bash
docker run -v "<local image dir>:/edkrepo/nvidia-uefi/images/" -it makinbacon/nvidia-edk2-docker:latest /bin/bash
```

4. Run the build script

```bash
edk2-nvidia/Platform/NVIDIA/Jetson/build.sh
```
