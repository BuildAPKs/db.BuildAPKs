#!/usr/bin/env bash
# Copyright 2019-2022 (c) all rights reserved
# by BuildAPKs; see LICENSE  https://buildAPKs.github.io
#####################################################################
set -eu
export RDR="$HOME/buildAPKs"
if [ $( awk '{print $5}' BNAMES | sort -gu | head -n 1 ) != 0 ]
then
	: # do nothing
else
	echo "File BNAMES is corrupt!  EXITING..."
	exit
fi
if [ $( awk '{print $2}' GNAMES | sort -u | wc -c ) = 18 ]
then
	: # do nothing
else
	echo "File GNAMES is corrupt!  EXITING..."
	exit
fi
if [ $( awk '{print $5}' "$RDR/var/db/BNAMES" | sort -gu | head -n 1 ) != 0 ]
then
	: # do nothing
else
	echo "File ~/${RDR##*/}/var/db/BNAMES  is corrupt!  EXITING..."
	exit
fi
if [ $( awk '{print $2}' "$RDR/var/db/GNAMES" | sort -u | wc -c ) = 18 ]
then
	: # do nothing
else
	echo "File ~/${RDR##*/}/var/db/GNAMES is corrupt!  EXITING..."
	exit
fi

_MERGEBFILES_ ()
{
	MVNAMES="BNAMES B10NAMES B100NAMES B1KNAMES"
	printf "%s\\n" "Processing $MVNAMES names files:"
	for FILENAME in $MVNAMES
	do
		if [ -f "$RDR/var/db/$FILENAME" ]	# file exists
		then	# process file
			printf "%s\\n" "Processing $FILENAME"
			NNAMESARR=($(cut -f 1 -d ' ' "$RDR/var/db/$FILENAME"))	# create processed new names array
			for USENAME in ${NNAMESARR[@]}
			do
				NEWNAME=$(grep "^$USENAME " "$RDR/var/db/$FILENAME" | head -1) || _SIGNAL_ "12" "_MERGEBFILES_ NEWNAME"
				NEWNAME="${NEWNAME%"${NEWNAME##*[![:space:]]}"}"	# remove trailing whitespace characters
				OLDNAME=$(grep "^$USENAME " "$FILENAME" | head -1) || _SIGNAL_ "14" "_MERGEBFILES_ OLDNAME"
				if [[ -z "${OLDNAME:-}" ]]	# OLDNAME does not exist in db.BuildAPKs
				then	# add NEWNAME to db.BuildAPKs
					_PRINTA_
					printf "%s\\n" "$NEWNAME" >> "$FILENAME"
				else
					if [[ $(awk '{print $2}' <<< $NEWNAME) -ne $(awk '{print $2}' <<< $OLDNAME) ]]	# dates are not equal
					then	# delete OLDNAME and add NEWNAME
						_PRINTR_
 						sed -i "/^$USENAME /d" "$FILENAME"
 						printf "%s\\n" "$NEWNAME" >> "$FILENAME"
:
					else
						if [[ $(awk '{print $5}' <<< $NEWNAME) -ne $(awk '{print $5}' <<< $OLDNAME) ]]	# number of AndroidManifest.xml files found is not equal
						then	# delete OLDNAME and add NEWNAME
							_PRINTR_
 							sed -i "/^$USENAME /d" "$FILENAME"
 							printf "%s\\n" "$NEWNAME" >> "$FILENAME"
						else
							if [[ $(awk '{print $6}' <<< $NEWNAME) -ne $(awk '{print $6}' <<< $OLDNAME) ]]	# number of APK files built is unequal
							then	# delete OLDNAME and add NEWNAME
								_PRINTR_
	 							sed -i "/^$USENAME /d" "$FILENAME"
	 							printf "%s\\n" "$NEWNAME" >> "$FILENAME"
							fi
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

_MERGEFILES_ () {
	MVNAMES="GNAMES QNAMES YNAMES ZNAMES"
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

_PRINTA_ () {
	printf "%s\\n" "Adding $NEWNAME to $FILENAME; Continuing..."
}
_PRINTR_ () {
	printf "%s\\n" "Replacing $NEWNAME in $FILENAME; Continuing..."
}
_SIGNAL_ () {
		STRING="SIGNAL $1 generated in $2 ${0##*/} mn.bash!  Continuing...  "
		printf "\\e[2;7;38;5;210m%s\\e[0m" "$STRING"
}
if [ "${PWD##*/}" = db.BuildAPKs ]
then
 	_MERGEFILES_
	_MERGEBFILES_
else
	printf "%s\\n" "Run ${0##*/} in directory db.BuildAPKs; Exiting..."
fi
# mn.bash EOF
