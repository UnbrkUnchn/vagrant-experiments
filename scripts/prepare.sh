#!/usr/bin/env bash
# Первый провижинер (имя: prepare).
# Только apt update — отдельно от стека, чтобы было видно, какой шаг падает:
#   vagrant provision --provision-with prepare
set -e
export DEBIAN_FRONTEND=noninteractive
export NEEDRESTART_SUSPEND=1
apt-get update
