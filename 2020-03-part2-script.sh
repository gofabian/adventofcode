#!/bin/sh

set -e

trees() {
    cat 2020-03-input.txt | awk -v RIGHT=$1 -v DOWN=$2 '
        BEGIN { 
            INDEX = 0
            TREES = 0
        }
        {
            if ((NR-1) % DOWN == 0)
            {
                LINE=$0
                POINT = substr(LINE,INDEX+1,1)
                if (POINT == "#")
                    TREES++

                INDEX = (INDEX + RIGHT) % length(LINE)
            }
        }
        END {
            print TREES
        }'
}

results="$(trees 1 1)"
results="$results $(trees 3 1)"
results="$results $(trees 5 1)"
results="$results $(trees 7 1)"
results="$results $(trees 1 2)"

echo $results

multiplied=0
for r in $results; do
    if [ "$multiplied" == "0" ]; then
        multiplied=$r
    else
        multiplied=$(($multiplied * $r))
    fi
done

echo $multiplied