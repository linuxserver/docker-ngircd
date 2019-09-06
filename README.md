[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

[![Blog](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Blog)](https://blog.linuxserver.io "all the things you can do with our containers including How-To guides, opinions and much more!")
[![Discord](https://img.shields.io/discord/354974912613449730.svg?style=flat-square&color=E68523&label=Discord&logo=discord&logoColor=FFFFFF)](https://discord.gg/YWrKVTn "realtime support / chat with the community and the team.")
[![Discourse](https://img.shields.io/discourse/https/discourse.linuxserver.io/topics.svg?style=flat-square&color=E68523&logo=discourse&logoColor=FFFFFF)](https://discourse.linuxserver.io "post on our community forum.")
[![Fleet](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Fleet)](https://fleet.linuxserver.io "an online web interface which displays all of our maintained images.")
[![Podcast](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Podcast)](https://anchor.fm/linuxserverio "on hiatus. Coming back soon (late 2018).")
[![Open Collective](https://img.shields.io/opencollective/all/linuxserver.svg?style=flat-square&color=E68523&label=Open%20Collective%20Supporters)](https://opencollective.com/linuxserver "please consider helping us by either donating or contributing to our budget")

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [Discourse](https://discourse.linuxserver.io) - post on our community forum.
* [Fleet](https://fleet.linuxserver.io) - an online web interface which displays all of our maintained images.
* [Podcast](https://anchor.fm/linuxserverio) - on hiatus. Coming back soon (late 2018).
* [Open Collective](https://opencollective.com/linuxserver) - please consider helping us by either donating or contributing to our budget

# [linuxserver/ngircd](https://github.com/linuxserver/docker-ngircd)
[![GitHub Release](https://img.shields.io/github/release/linuxserver/docker-ngircd.svg?style=flat-square&color=E68523)](https://github.com/linuxserver/docker-ngircd/releases)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/linuxserver/ngircd.svg?style=flat-square&color=E68523)](https://microbadger.com/images/linuxserver/ngircd "Get your own version badge on microbadger.com")
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/linuxserver/ngircd.svg?style=flat-square&color=E68523)](https://microbadger.com/images/linuxserver/ngircd "Get your own version badge on microbadger.com")
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/ngircd.svg?style=flat-square&color=E68523)](https://hub.docker.com/r/linuxserver/ngircd)
[![Docker Stars](https://img.shields.io/docker/stars/linuxserver/ngircd.svg?style=flat-square&color=E68523)](https://hub.docker.com/r/linuxserver/ngircd)
[![Build Status](https://ci.linuxserver.io/view/all/job/Docker-Pipeline-Builders/job/docker-ngircd/job/master/badge/icon?style=flat-square)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-ngircd/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/ngircd/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/ngircd/latest/index.html)

[Ngircd](https://ngircd.barton.de/) is a free, portable and lightweight Internet Relay Chat server for small or private networks, developed under the GNU General Public License (GPL). It is easy to configure, can cope with dynamic IP addresses, and supports IPv6, SSL-protected connections as well as PAM for authentication. It is written from scratch and not based on the original IRCd.

[![ngircd](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/ngircd-logo.png)](https://ngircd.barton.de/)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list) and our announcement [here](https://blog.linuxserver.io/2019/02/21/the-lsio-pipeline-project/).

Simply pulling `linuxserver/ngircd` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v7-latest |


## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=ngircd \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 6667:6667 \
  -v </path/to/ngircd/config>:/config \
  --restart unless-stopped \
  linuxserver/ngircd
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  ngircd:
    image: linuxserver/ngircd
    container_name: ngircd
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
      - </path/to/ngircd/config>:/config
    ports:
      - 6667:6667
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 6667` | ngircd port |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Europe/London` | Specify a timezone to use e.g. Europe/London |
| `-v /config` | Where `ngircd.conf` is stored |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```


&nbsp;
## Application Setup

- To setup ngircd you will need to edit `/config/ngircd.conf` which is created the first time the container is run, edit the file and restart the container to implement any config changes.  
- For information see the ngircd site [here.](https://github.com/ngircd/ngircd/blob/master/doc/sample-ngircd.conf.tmpl)



## Support Info

* Shell access whilst the container is running: `docker exec -it ngircd /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f ngircd`
* container version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' ngircd`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/ngircd`

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (ie. nextcloud, plex), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.

Below are the instructions for updating containers:

### Via Docker Run/Create
* Update the image: `docker pull linuxserver/ngircd`
* Stop the running container: `docker stop ngircd`
* Delete the container: `docker rm ngircd`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start ngircd`
* You can also remove the old dangling images: `docker image prune`

### Via Docker Compose
* Update all images: `docker-compose pull`
  * or update a single image: `docker-compose pull ngircd`
* Let compose update all containers as necessary: `docker-compose up -d`
  * or update a single container: `docker-compose up -d ngircd`
* You can also remove the old dangling images: `docker image prune`

### Via Watchtower auto-updater (especially useful if you don't remember the original parameters)
* Pull the latest image at its tag and replace it with the same env variables in one run:
  ```
  docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower \
  --run-once ngircd
  ```

**Note:** We do not endorse the use of Watchtower as a solution to automated updates of existing Docker containers. In fact we generally discourage automated updates. However, this is a useful tool for one-time manual updates of containers where you have forgotten the original parameters. In the long term, we highly recommend using Docker Compose.

* You can also remove the old dangling images: `docker image prune`

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:
```
git clone https://github.com/linuxserver/docker-ngircd.git
cd docker-ngircd
docker build \
  --no-cache \
  --pull \
  -t linuxserver/ngircd:latest .
```

The ARM variants can be built on x86_64 hardware using `multiarch/qemu-user-static`
```
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

Once registered you can define the dockerfile to use with `-f Dockerfile.aarch64`.

## Versions

* **04.07.19:** - Initial release.
