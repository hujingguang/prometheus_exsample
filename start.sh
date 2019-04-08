#!/bin/bash - 
#===============================================================================
#
#          FILE: start.sh
# 
#         USAGE: ./start.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2019/04/08 19:04
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


./sbin/prometheus  --config.file=/data/prometheus_server/etc/prometheus.yml  --storage.tsdb.path=/data/prometheus_server/data


docker run --name dingtalk_alert -p 8889:8889 -d hooversa/dingtalk_alert ./alert.py -p 8889 -w 'ld_for_ops==https://oapi.dingtalk.com/robot/send?access_token=466704a3f55b'

