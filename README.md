# Podman Debian container image with IceWM VNC environment

This repository contains a Podman Debian container image with an IceWM VNC environment, with the following components installed:

* Desktop environment: [IceWM](https://ice-wm.org/)
* VNC server (default VNC port: `5901`)
* [noVNC](https://github.com/novnc/noVNC) - HTML5 VNC client (default http port: `6901`)
* Browsers:
  * Mozilla Firefox
  * Chromium

## Changes from upstream

- Removed all Rocky Linux and XFCE images to focus on Debian and IceWM
- Updated base image from Debian Bookworm (12) to Debian Trixie (13)
- Switched to installing all software from the Debian repositories, streamlining the build process, keeping up to date and fixing architecture errors
- Fixed issues with missing icons in the IceWM menus and changed the default IceWM theme to `motif` from `win95`
- Replaced xterm with alacritty for a more modern terminal experience
- Added a compose.yaml file for easier container management
- Removed extraneous code and dependencies and replaced vim with nano

## Usage

1. Install podman and podman-compose, then `git clone` this repository
2. Run `podman-compose up` to build and start the container
3. Access the noVNC client via http://localhost:6901/vnc.html in your web browser

## Contributors

This repository was forked from [ConSol/docker-headless-vnc-container](https://github.com/ConSol/docker-headless-vnc-container); many thanks go to its contributors.
