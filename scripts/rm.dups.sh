#!/usr/bin/env sh
# Copyright 2019-2022 (c) all rights reserved
# by BuildAPKs; see LICENSE  https://BuildAPKs.github.io
# Deletes duplicate names from NUNAME file.
# All names that build APKs on device; cat ONAMES UNAMES
#####################################################################
set -e
printf "Processing duplicate names in NUNAMES.  Please wait..."
for NAME in $(cat [CEOPUZ]NAMES | sort | uniq)
do
	grep -iv "$NAME" NUNAMES > TEMP.FILE
	mv TEMP.FILE NUNAMES
done
printf "  DONE\\n"
# rm.dups.sh EOF
