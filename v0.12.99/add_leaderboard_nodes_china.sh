#!/bin/bash
#
# add leaderboard nodes to bitcoind, ip list is from bitnodes.21.co
#
# @copyright btc.com
# @author Zhibiao Pan
# @since 2016-08
#

curl "https://bitnodes.21.co/nodes/leaderboard/?q=china" | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort -n | uniq | xargs -I{} bitcoin-cli addnode "{}" "onetry"
