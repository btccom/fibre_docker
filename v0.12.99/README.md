Docker for Bitcoind Fibre v0.12.99
===================================

* OS: `Ubuntu 14.04 LTS`
* Docker Image OS: `Ubuntu 16.04 LTS`
* `Fibre`
  * `https://github.com/TheBlueMatt/bitcoin/tree/udp-wip`
  * last commit: [eaaa1f68a4ad67405e13bcf0ef707a965f782b39](https://github.com/TheBlueMatt/bitcoin/commit/eaaa1f68a4ad67405e13bcf0ef707a965f782b39)


## Install Docker

```
wget -qO- https://get.docker.com/ | sh
service docker start
service docker status
```

## Build Docker Images

```
mkdir /root/source
cd /root/source

git clone git@github.com:btccom/fibre_docker.git
cd fibre_docker/v0.12.99

# if you install nodes in China, please check "Dockerfile" and uncomment some lines

# build
docker build -t fibre-bitcoind:0.12.99 .
# docker build --no-cache -t fibre-bitcoind:0.12.99 .

# mkdir for bitcoind
mkdir -p /work/bitcoind

# bitcoin.conf
touch /work/bitcoind/bitcoin.conf
```

### bitcoin.conf example

```
rpcuser=bitcoinrpc
# generate random rpc password:
#   $ strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo
rpcpassword=xxxxxxxxxxxxxxxxxxxxxxxxxx
rpcthreads=4

rpcallowip=172.17.0.0/16
rpcallowip=192.168.0.0/16
rpcallowip=10.0.0.0/8

# fibre udp port
udpport=8334

# add fibre nodes
addtrustedudpnode=123.123.123.123:8334,random_string,random_string
addtrustedudpnode=123.123.123.123:8334,random_string,random_string
addtrustedudpnode=123.123.123.123:8334,random_string,random_string
```

## Start Docker Container

```
# start
docker run -it -v /work/bitcoind:/root/.bitcoin --name fibre-bitcoind -p 8333:8333 -p 8332:8332 -p 8334:8334/udp --restart always -d fibre-bitcoind:0.12.99

# login
docker exec -it fibre-bitcoind /bin/bash
```
