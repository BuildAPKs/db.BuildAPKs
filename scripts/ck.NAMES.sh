#!/usr/bin/env sh
# Copyright 2020 (c) all rights reserved by BuildAPKs; see LICENSE
# https://buildapks.github.io published courtesy https://pages.github.com
#################################################################################
set -eu
export RDR="$HOME/buildAPKs"
( [ $( awk '{print $5}' BNAMES | sort -gu | head -n 1 ) != 0 ] && echo ok ) || ( echo "BNAMES file is corrupt!  EXITING..." && exit )
( [ $( awk '{print $2}' GNAMES | sort -gu | head -n 1 ) != 0 ] && echo ok ) || ( echo "GNAMES file is corrupt!  EXITING..." && exit )
( [ $( awk '{print $5}' "$RDR/var/db/BNAMES" | sort -gu | head -n 1 ) != 0 ] && echo ok ) || echo "BNAMES file is corrupt!  EXITING..." && exit 
( [ $( awk '{print $2}' "$RDR/var/db/GNAMES" | sort -gu | head -n 1 ) != 0 ] && echo ok ) || echo "GNAMES file is corrupt!  EXITING..." && exit 
# ck.NAMES.sh OEF
