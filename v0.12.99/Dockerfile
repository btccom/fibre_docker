#
# Dockerfile
#
# @author zhibiao.pan@bitmain.com
# @copyright btc.com
# @since 2016-08-01
#
#
FROM phusion/baseimage:0.9.19
MAINTAINER PanZhibiao <zhibiao.pan@bitmain.com>

ENV HOME /root
ENV TERM xterm
CMD ["/sbin/my_init"]

# use aliyun source
#ADD sources-aliyun.com.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils yasm
RUN apt-get install -y libboost-all-dev libzmq3-dev curl

# build bitcoind
RUN mkdir ~/source
ADD bitcoin-v0.12.99-udp-wip.tar.gz /root/source/bitcoin-v0.12.99-udp-wip.tar.gz
RUN cd ~/source/bitcoin-v0.12.99-udp-wip.tar.gz/bitcoin \
  && ./autogen.sh \
  && ./configure --disable-wallet
RUN cd ~/source/bitcoin-v0.12.99-udp-wip.tar.gz/bitcoin && make -j2 && make install

# mkdir bitcoind data dir
RUN mkdir -p /root/.bitcoin
RUN mkdir -p /root/scripts

# scripts
ADD bitmain-monitor-bitcoind.sh   /root/scripts/bitmain-monitor-bitcoind.sh

# crontab shell
ADD add_leaderboard_nodes.sh          /root/scripts/add_leaderboard_nodes.sh
# if your nodes is in China(Mainland), please uncomment this line
#ADD add_leaderboard_nodes_china.sh    /root/scripts/add_leaderboard_nodes_china.sh
ADD add_leaderboard_nodes_global.sh   /root/scripts/add_leaderboard_nodes_global.sh
ADD crontab.txt /etc/cron.d/bitcoind

# logrotate
ADD logrotate-bitcoind /etc/logrotate.d/bitcoind

# services
RUN mkdir /etc/service/fibred
ADD run /etc/service/fibred/run
RUN chmod +x /etc/service/fibred/run

# remove source & build files
RUN rm -rf ~/source

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
