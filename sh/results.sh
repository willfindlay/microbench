#! /usr/bin/env sh

# Date
DATE=$(date '+%Y_%m_%d_%H:%M:%S')

# Directories
RESULTS="results/${DATE}"
ROOT="$(readlink -f .)"
BIN="${ROOT}/bin"

# /dev/null
DEVNULL="/dev/null"

# Number of trials
TRIALS="$1:-1000"

cd ${ROOT}

echo "Creating ${RESULTS}..."
mkdir -p "${RESULTS}"

for file in ${BIN}/*; do
    [ -e ${file} ] || continue
    ${file} ${TRIALS} > ${DEVNULL} 2> ${RESULTS}/${file##*/}.log
done;
