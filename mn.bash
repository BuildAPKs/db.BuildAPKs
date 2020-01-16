#!/usr/bin/env bash
# Copyright 2019-2020 (c) all rights reserved
# by BuildAPKs; see LICENSE  https://buildAPKs.github.io
#####################################################################
set -e
RDR="$HOME/buildAPKs"
_MERGEBFILES_ ()
{
	MVNAMES="BNAMES B10NAMES B100NAMES B1000NAMES"
	printf "%s\\n" "Processing $MVNAMES names files:"
	for FILENAME in $MVNAMES
	do
		if [ -f "$RDR/var/db/$FILENAME" ]	# file exists
		then	# process file 
			printf "%s\\n" "Processing $FILENAME"
			NNAMESARR=($(cut -f 1 -d ' ' "$RDR/var/db/$FILENAME"))	# create processed new names array
			for USENAME in ${NNAMESARR[@]}
			do
				NEWNAME=$(grep "^$USENAME " "$RDR/var/db/$FILENAME" | head -1) ||:
				OLDNAME=$(grep "^$USENAME " "$FILENAME" | head -1) ||:
				if [[ -z "${OLDNAME:-}" ]]	# OLDNAME does not exist in db.BuildAPKs
				then	# add NEWNAME to db.BuildAPKs
					printf "%s\\n" "$NEWNAME" >> "$FILENAME"
				else
					if [[ $(awk '{print $2}' <<< $NEWNAME) -ne $(awk '{print $2}' <<< $OLDNAME) ]]	# dates are not equal
					then	# delete OLDNAME and add NEWNAME 
 						sed -i "/^$USENAME /d" "$FILENAME"
 						printf "%s\\n" "$NEWNAME" >> "$FILENAME"
:
					else
						if [[ $(awk '{print $5}' <<< $NEWNAME) -ne $(awk '{print $5}' <<< $OLDNAME) ]]	# number of AndroidManifest files found is not equal 
						then	# delete OLDNAME and add NEWNAME 
 							sed -i "/^$USENAME /d" "$FILENAME"
 							printf "%s\\n" "$NEWNAME" >> "$FILENAME"
						fi
					fi
				fi
			done
		cat "$FILENAME" | sort | uniq > "$RDR/var/tmp/$FILENAME.$$.tmp"
		mv "$RDR/var/tmp/$FILENAME.$$.tmp" "$FILENAME"
		fi
	done
	printf "%s\\n" "Processing $MVNAMES names files: DONE"
}
 
_MERGEFILES_ ()
{
	MVNAMES="GNAMES QNAMES RNAMES YNAMES ZNAMES"
	printf "%s\\n" "Processing $MVNAMES names files:"
	for FILENAME in $MVNAMES
	do
		if [ -f "$RDR/var/db/$FILENAME" ]
		then
			printf "%s\\n" "Processing $FILENAME"
			cat "$RDR/var/db/$FILENAME" "$FILENAME" | sort | uniq > "$RDR/var/tmp/$FILENAME.$$.tmp"
			mv "$RDR/var/tmp/$FILENAME.$$.tmp" "$FILENAME"
		fi
	done
	printf "%s\\n" "Processing $MVNAMES names files: DONE"
}
if [ "${PWD##*/}" = db.BuildAPKs ]
then 
 	_MERGEFILES_
	_MERGEBFILES_
else
	printf "%s\\n" "Run ${0##*/} in directory db.BuildAPKs; Exiting..."
fi
# mn.bash EOF