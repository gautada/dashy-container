ARG ALPINE_VERSION=3.16.3

# ╭―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――╮
# │                                                                           │
# │ STAGE 1: dashy - Configure application                                    │
# │                                                                           │
# ╰―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――╯
FROM gautada/alpine:$ALPINE_VERSION

# ╭――――――――――――――――――――╮
# │ METADATA           │
# ╰――――――――――――――――――――╯
LABEL source="https://github.com/gautada/drone-container.git"
LABEL maintainer="Adam Gautier <adam@gautier.org>"
LABEL description="This container is a a drone CI installation."

# ╭――――――――――――――――――――╮
# │ PACKAGES           │
# ╰――――――――――――――――――――╯
RUN /sbin/apk add --no-cache git npm yarn

# ╭――――――――――――――――――――╮
# │ SOURCE             │
# ╰――――――――――――――――――――╯
ARG DASH_VERSION=2.1.1
RUN git config --global advice.detachedHead false
RUN /bin/mkdir -p /opt/dashy
RUN git clone --branch $DASH_VERSION --depth 1 https://github.com/Lissy93/dashy.git /opt/dashy

# ╭――――――――――――――――――――╮
# │ ENTRYPOINT         │
# ╰――――――――――――――――――――╯
RUN rm -v /etc/container/entrypoint
COPY entrypoint /etc/container/entrypoint

# ╭――――――――――――――――――――╮
# │ USER               │
# ╰――――――――――――――――――――╯
ARG UID=1001
ARG GID=1001
ARG USER=dashy

RUN /usr/sbin/addgroup -g $GID $USER \
 && /usr/sbin/adduser -D -G $USER -s /bin/ash -u $UID $USER \
 && /usr/sbin/usermod -aG wheel $USER \
 && /bin/echo "$USER:$USER" | chpasswd \
 && chown dashy:dashy -R /opt/dashy
 
USER dashy

WORKDIR /opt/dashy
RUN /usr/bin/yarn install --frozen-lockfile --network-timeout 1000000
RUN /usr/bin/yarn build --mode production
RUN rm -rf public
RUN ln -fsv /mnt/volumes/container public

# RUN /bin/ln -fsv /mnt/volumes/container/conf.yml /mnt/volumes/configmaps/conf.yml
# RUN /bin/ln -fsv /mnt/volumes/configmaps/conf.yml /etc/container/conf.yml
# RUN mv /opt/dashy/public/conf.yml  /opt/dashy/public/conf.yml~ \
#  && /bin/ln -fsv /etc/container/conf.yml /opt/dashy/public/conf.yml


# ╭――――――――――――――――――――╮
# │ PORTS              │
# ╰――――――――――――――――――――╯
EXPOSE 4000
