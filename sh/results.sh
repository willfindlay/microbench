#! /usr/bin/env sh

DATE=$(date '+%Y_%m_%d_%H:%M:%S')
RESULTS="results/${DATE}"
ROOT="$(readlink -f .)"
BIN="${ROOT}/bin"

TRIALS="$1:-1000"

cd ${ROOT}

#echo "Creating ${RESULTS}..."
#mkdir -p "${RESULTS}"

for file in ${BIN}/*; do
    [ -e ${file} ] || continue
    echo ${file}
done;
