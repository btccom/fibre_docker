#!/bin/bash
#
# add leaderboard nodes to bitcoind, ip list is from bitnodes.21.co
#
# @copyright btc.com
# @author Zhibiao Pan
# @since 2016-08
#

NODES_GLOBAL="/root/scripts/add_leaderboard_nodes_global.sh"
NODES_CHINA="/root/scripts/add_leaderboard_nodes_china.sh"

if [ -f "$NODES_GLOBAL" ]; then
  bash "$NODES_GLOBAL"
fi

if [ -f "$NODES_CHINA" ]; then
  bash "$NODES_CHINA"
fi
