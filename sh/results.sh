#! /usr/bin/env bash

# Date
DATE=$(date '+%Y_%m_%d_%H:%M:%S')

# Directories
ROOT="$(readlink -f .)"
RESULTSDIR="$ROOT/results"
RESULTS="$RESULTSDIR/$DATE"
BIN="$ROOT/bin"

# Number of trials
TRIALS=${1:-1000}

cd $ROOT

mkdir -p "$RESULTSDIR"

results()
{
    date
    sleep 1
    for (( i=0; i<$TRIALS; i++ )); do
        $BIN/fork > /dev/null
        $BIN/forkexec > /dev/null
        $BIN/system > /dev/null
    done
}

results 2>&1 | tee $RESULTS
