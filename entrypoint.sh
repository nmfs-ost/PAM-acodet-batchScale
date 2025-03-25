#!/bin/bash

#feed in any ENV parameters into yaml

CMD2="python /app/stage_params.py"

CMD2="python /app/run.py"

echo $CMD2
eval $CMD2
