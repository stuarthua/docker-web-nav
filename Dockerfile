FROM lsiobase/nginx:3.11

# set label
LABEL maintainer="stuarthua"

# package versions
ARG WEBNAV_RELEASE

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache  \
	curl \
	php7-tidy \
	php7-curl \
	php7-mbstring \
	php7-sqlite3 \
	php7-pdo_sqlite \
	php7-ctype \
	php7-tokenizer \
	tar && \
 echo "**** configure php-fpm ****" && \
 sed -i 's/;clear_env = no/clear_env = no/g' /etc/php7/php-fpm.d/www.conf && \
 echo "env[PATH] = /usr/local/bin:/usr/bin:/bin" >> /etc/php7/php-fpm.conf && \
 echo "**** fetch webnav ****" && \
 mkdir -p\
	/var/www/html && \
 if [ -z ${WEBNAV_RELEASE+x} ]; then \
	WEBNAV_RELEASE=$(curl -sX GET "https://api.github.com/repos/stuarthua/web-nav/releases/latest" \
	| awk '/tag_name/{print $4;exit}' FS='[""]'); \
 fi && \
 curl -o \
 /tmp/webnav.tar.gz -L \
	"https://github.com/stuarthua/web-nav/archive/${WEBNAV_RELEASE}.tar.gz" && \
 tar xf \
 /tmp/webnav.tar.gz -C \
	/var/www/html/ --strip-components=1 && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 80 443
VOLUME /config/keys