FROM archlinux:latest
RUN echo -e "Server = https://mirror.cat.net/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
RUN pacman-key --init
RUN pacman-key --populate archlinux
RUN pacman -Sy archlinux-keyring --noconfirm
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm wget
RUN pacman -S --noconfirm git
RUN pacman -S --noconfirm curl
RUN pacman -S --noconfirm nano
RUN pacman -S --noconfirm vi
RUN pacman -S --noconfirm vim
RUN pacman -S --noconfirm neovim
RUN pacman -S --noconfirm rpm
RUN pacman -S --noconfirm tree 
RUN pacman -S --noconfirm rustup
RUN pacman -S --noconfirm kotlin
RUN pacman -S --noconfirm jdk-openjdk
RUN pacman -S --noconfirm go
RUN pacman -S --noconfirm nodejs
RUN pacman -S --noconfirm npm
RUN pacman -S --noconfirm gcc
RUN pacman -S --noconfirm dotnet-sdk
RUN pacman -S --noconfirm python
RUN pacman -S --noconfirm python-pip
RUN pacman -S --noconfirm php
RUN pacman -S --noconfirm jq
RUN pacman -S --noconfirm gnupg
RUN pacman -S --noconfirm rsync
RUN pacman -S --noconfirm unzip
RUN pacman -S --noconfirm bash-bats
RUN pacman -S --noconfirm node-gyp
RUN pacman -S --noconfirm git-lfs
RUN pacman -S --noconfirm pkg-config
RUN pacman -S --noconfirm libx11
RUN pacman -S --noconfirm libxkbfile
RUN pacman -S --noconfirm quilt
RUN pacman -S --noconfirm make
RUN rustup default stable
EXPOSE 8080
ARG VERSION=latest
ENTRYPOINT bash -c "rpm -i https://github.com/coder/code-server/releases/download/$(curl --silent "https://api.github.com/repos/coder/code-server/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')/code-server-$(curl --silent "https://api.github.com/repos/coder/code-server/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed 's/v//')-amd64.rpm && pacman -Syyu --noconfirm && code-server --bind-addr 0.0.0.0:8080"
