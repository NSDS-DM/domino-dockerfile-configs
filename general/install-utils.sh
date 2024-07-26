#!/bin/bash
# bash strict mode (http://redsymbol.net/articles/unofficial-bash-strict-mode/)
set -euo pipefail


apt update && \
    apt install cmake less tmux tree vim -y

echo 'Goodbye!'
