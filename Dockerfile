FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  build-essential autoconf autoconf-archive libx11-dev giblib-dev libxfixes-dev libxcursor-dev

WORKDIR /build
COPY . .

RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
RUN cp /usr/local/bin/scrot /scrot
