ARG ALPINE_VERSION=3.16.3

# ╭―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――╮
# │                                                                           │
# │ STAGE: Build Source                                                       │
# │                                                                           │
# ╰―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――╯
FROM node:16.13.2-alpine AS SRC

# ╭――――――――――――――――――――╮
# │ VERSION            │
# ╰――――――――――――――――――――╯
ARG DASH_VERSION=2.1.1

# ╭――――――――――――――――――――╮
# │ PACKAGES           │
# ╰――――――――――――――――――――╯
RUN apk add --no-cache build-base git yarn

# ╭――――――――――――――――――――╮
# │ SOURCE             │
# ╰――――――――――――――――――――╯
RUN /usr/bin/git config --global advice.detachedHead false
RUN /usr/bin/git clone --branch $DASH_VERSION --depth 1 https://github.com/Lissy93/dashy.git /app

# ╭――――――――――――――――――――╮
# │ BUILD              │
# ╰――――――――――――――――――――╯
WORKDIR /app
RUN /usr/bin/yarn install --frozen-lockfile --network-timeout 1000000
RUN /usr/bin/yarn build --mode production


# ╭―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――╮
# │                                                                           │
# │ STAGE: Application                                                        │
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
# RUN /sbin/apk add --no-cache git npm nodejs-current yarn
RUN /sbin/apk add --no-cache yarn


# ╭――――――――――――――――――――╮
# │ STANDARD CONFIG    │
# ╰――――――――――――――――――――╯

# USER:
ARG USER=dashy

ARG UID=1001
ARG GID=1001
RUN /usr/sbin/addgroup -g $GID $USER \
 && /usr/sbin/adduser -D -G $USER -s /bin/ash -u $UID $USER \
 && /usr/sbin/usermod -aG wheel $USER \
 && /bin/echo "$USER:$USER" | chpasswd

# PRIVILEGE:
# COPY wheel  /etc/container/wheel

# BACKUP:
# COPY backup /etc/container/backup

# ENTRYPOINT:
RUN /bin/rm -v /etc/container/entrypoint
COPY entrypoint /etc/container/entrypoint

# FOLDERS
RUN /bin/chown -R $USER:$USER /mnt/volumes/container \
 && /bin/chown -R $USER:$USER /mnt/volumes/backup \
 && /bin/chown -R $USER:$USER /var/backup \
 && /bin/chown -R $USER:$USER /tmp/backup


# ╭――――――――――――――――――――╮
# │ APPLICATION        │
# ╰――――――――――――――――――――╯
WORKDIR /home/$USER
COPY --from=SRC /app /home/$USER
RUN /bin/mv /home/$USER/public /home/$USER/public~
RUN /bin/ln -fsv /mnt/volumes/container /home/$USER/public

RUN /bin/ln -fsv /mnt/volumes/container/conf.yml /mnt/volumes/configmaps/conf.yml
RUN /bin/ln -fsv /mnt/volumes/configmaps/conf.yml /etc/container/conf.yml
RUN rm /home/$USER/dist/conf.yml
# RUN /bin/mv /home/$USER/public/conf.yml  /home/$USER/public/conf.yml~
# RUN /bin/ln -fsv /etc/container/conf.yml /home/$USER/public/conf.yml

# ╭――――――――――――――――――――╮
# │ CONTAINER          │
# ╰――――――――――――――――――――╯
USER $USER
VOLUME /mnt/volumes/backup
VOLUME /mnt/volumes/configmaps
VOLUME /mnt/volumes/container
EXPOSE 4000/tcp
WORKDIR /home/$USER

