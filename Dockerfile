FROM node:current

ARG buildno
ARG commitsha

LABEL maintainer="Remco Jongschaap <konovalov8060@gmail.com>" \
      repository="https://github.com/Nurlashka/WildBeast"

RUN mkdir /opt/wildbeast
# Copy files and install modules
COPY . /opt/wildbeast
WORKDIR /opt/wildbeast
RUN npm ci --production
# Install optional native modules
# TODO: swap out UWS whenever a better module is available
RUN npm i zlib-sync uws@10.148.1 https://github.com/discordapp/erlpack.git bufferutil pg
CMD ["node", "index.js"]
