# debian:10-slim
ARG BASE_IMAGE=debian@sha256:7f5c2603ccccb7fa4fc934bad5494ee9f47a5708ed0233f5cd9200fe616002ad
FROM $BASE_IMAGE

# See the 'docker' directory for arm32v7/arm64v8

# Build settings
ARG INSTALL=bitcoind,bwt,btc-rpc-explorer,specter,tor,nginx,letsencrypt,dropbear
ARG DEV

ARG BWT_VERSION=0.2.4
ARG BWT_ARCH=x86_64-linux
ARG BWT_SHA256=a98fc1820e53d928d58253c9e45327deb6339f30afe443350d29662937095c0f

ARG BITCOIND_VERSION=22.0
ARG BITCOIND_ARCH=x86_64-linux-gnu
ARG BITCOIND_SHA256=59ebd25dd82a51638b7a6bb914586201e67db67b919b2a1ff08925a7936d1b16

ARG BTCEXP_VERSION=3.3.0
ARG BTCEXP_SHA256=52f6f559310df04450f819983c1d78223f3ed48e3ec520242201557adf063e20

ARG SPECTER_VERSION=1.9.1
ARG SPECTER_SHA256=3d5cabbe7ec9e994c24c24de03dd324e232317bd6afe8891373eac4f61b777da

ARG S6_OVERLAY_VERSION=2.2.0.1
ARG S6_OVERLAY_ARCH=amd64
ARG S6_OVERLAY_SHA256=2dcb59b63d1d0f5f056d4e10d6cbae21a9c216e130080d3b5aaa8e7325ac571b

ARG NODEJS_VERSION=16.14.2
ARG NODEJS_ARCH=linux-x64
ARG NODEJS_SHA256=57e02c27eb5e52f560f72d96240e898cb52818dc9fc50f45478ce39ece38583a

COPY . /tmp/setup
RUN (cd /tmp/setup && ./install.sh) && rm -r /tmp/*

# Runtime settings
ENV NETWORK=bitcoin
ENV BWT=1
ENV EXPLORER=1
ENV SPECTER=0
ENV TOR=0
ENV SSL=0
ENV SSHD=0
ENV BWT_LOGS=1

ENV PATH=/ez/bin:$PATH
ENTRYPOINT ["/ez/entrypoint.sh"]
