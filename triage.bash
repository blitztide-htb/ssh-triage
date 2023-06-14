#!/bin/bash

function usage() {
	echo "Usage: $0 -T targetip -U username"
	exit
}

while getopts "h?T:U:S:F:" opt; do
	case "$opt" in
		h|\?)
			echo "HELP"
			;;
		T) TARGET=$OPTARG
			;;
		U) USER=$OPTARG
			;;
		S) SCRIPT=$OPTARG
			;;
		F) TARGETDIR=$OPTARG
			;;
	esac
done	

if [ -z $USER ]; then usage; fi;
if [ -z $TARGET ]; then usage; fi;
SCRIPT="${SCRIPT:=triage.sh}"
TARGETDIR="${TARGETDIR:=./triage/}"

# Create target triagedir
TARGETDIR=$TARGETDIR/$TARGET/$(date +%y%m%d%H%M%S)-$USER
mkdir -p $TARGETDIR

ssh $USER@$TARGET -C "bash -s" < $SCRIPT > $TARGETDIR/$SCRIPT.out
