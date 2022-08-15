# nvidia-edk2-docker
Dockerized build environment for NVIDIA's edkrepo- and mono-based edk2 build system.
From:
- https://github.com/NVIDIA/edk2-nvidia/wiki/Build
- https://github.com/NVIDIA/edk2-nvidia/blob/main/Platform/NVIDIA/Jetson/Build.md

## Setup
1. Build the container

```bash
docker build -t bacon/nv-build .
```

2. Open a shell

```bash
docker run -it bacon/nv-build /bin/bash
```

3. Run the build script

```bash
edk2-nvidia/Platform/NVIDIA/Jetson/build.sh
```
