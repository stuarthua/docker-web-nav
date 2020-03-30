# docker-web-nav

> Docker for Web Nav

## Web Nav

* See More: [stuarthua/web-nav](https://github.com/stuarthua/web-nav)

### Preview

![](https://raw.githubusercontent.com/stuarthua/PicGo/master/tmp/Snipaste_2020-03-30_21-43-20.png)

## Supported Architectures

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
  --name=web-nav \
  -e PUID=1000 \
  -e PGID=1000 \
  -p 80:80 \
  -p 443:443 \
  -v <path to data>:/data \
  -v <path to config>:/config/keys \
  --restart unless-stopped \
  stuarthua/web-nav
```
