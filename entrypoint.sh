#!/bin/bash

#feed in any ENV parameters into yaml

CMD1="python /app/stage_params.py"

echo $CMD1
eval $CMD1

CMD2="python /app/run.py"

CMD3="python /app/HUWH_convert_acodet2netcdf.py"

ITERATION=1
while [ ! -f "donefile.txt" ]; do
  echo ITERATION:$ITERATION $CMD2
  eval $CMD2
  ((ITERATION++))
done

[ ! -z "${THRESH}" ] && CMD3+=" $THRESH"

eval $CMD3 