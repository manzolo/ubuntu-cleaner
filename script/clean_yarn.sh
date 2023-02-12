#! /bin/bash
. $(dirname $BASH_SOURCE)/__functions.sh

echo "Yarn clear cache..."
yarn cache clean || true