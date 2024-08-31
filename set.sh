#!/bin/bash

set -e

FAILURE()
{
    echo "Failed at $1:$2"
}

trap 'FAILURE "${LINENO}" "$BASH_COMMAND"' ERR

echo "hello world"
echoo "hello world 2"