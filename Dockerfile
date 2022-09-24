# Turns out NVIDIA's edk2 impl doesn't build right on newer distros

# Sources:
# https://github.com/NVIDIA/edk2-nvidia/wiki/Build
# https://github.com/NVIDIA/edk2-nvidia/blob/main/Platform/NVIDIA/Jetson/Build.md

FROM --platform=$TARGETPLATFORM ubuntu:focal

ARG TARGETPLATFORM
ARG BUILDPLATFORM

ARG BRANCH=main
ARG REPO="https://github.com/NVIDIA/edk2-edkrepo-manifest.git"
ENV BRANCH=${BRANCH} REPO=${REPO} ARCH=${ARCH}

# Set up env
ENV TZ=Etc/UTC

# Get deps
RUN apt-get -qq update > /dev/null
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq install apt-utils > /dev/null
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq upgrade -y > /dev/null
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq install -y build-essential uuid-dev git gcc python3 python3-setuptools python3-pip virtualenv wget \
      acpica-tools device-tree-compiler gnupg ca-certificates > /dev/null
RUN DEBIAN_FRONTEND=noninteractive [ "${TARGETPLATFORM}" ~= "linux/arm64*" ] && apt-get -qq install -y gcc || apt-get -qq install -y gcc-aarch64-linux-gnu

# Now that cert stuff is installed, get mono ready
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo deb "https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get -qq update > /dev/null
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq install -y mono-devel > /dev/null

# Config git just for kicks
RUN git config --global user.name "Default Name"
RUN git config --global user.email "default@email.com"

# Setup edkrepo
RUN mkdir edkrepo
WORKDIR /edkrepo
RUN wget https://github.com/tianocore/edk2-edkrepo/releases/download/edkrepo-v2.1.2/edkrepo-2.1.2.tar.gz
RUN tar xvf edkrepo-2.1.2.tar.gz
RUN ./install.py --user root --no-prompt

# Grab NVIDIA manifest and setup env
RUN edkrepo manifest-repos add nvidia ${REPO} main nvidia
RUN edkrepo clone nvidia-uefi NVIDIA-Jetson ${BRANCH}
WORKDIR /edkrepo/nvidia-uefi

CMD [ "/bin/bash" ]
