# Podman Debian container image with IceWM VNC environment

This repository contains a Podman Debian container image with an IceWM VNC environment, with the following components installed:

* Desktop environment: [IceWM](https://ice-wm.org/)
* VNC server (default VNC port: `5901`)
* [noVNC](https://github.com/novnc/noVNC) - HTML5 VNC client (default http port: `6901`)
* Browsers:
  * Mozilla Firefox
  * Chromium

## Usage

1. Install podman and podman-compose, then `git clone` this repository
2. Run `podman-compose up` to build and start the container
3. Access the noVNC client via `http://localhost:6901/vnc.html` in your web browser

## Contributors

This repository was forked from [ConSol/docker-headless-vnc-container](https://github.com/ConSol/docker-headless-vnc-container); many thanks go to its contributors.
