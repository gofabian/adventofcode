#!/bin/sh

cat 2020-03-input.txt | awk '
    BEGIN { 
        INDEX = 0
        TREES = 0
    }
    {
        LINE=$0
        POINT = substr(LINE,INDEX+1,1)
        if (POINT == "#")
            TREES++

        INDEX = (INDEX + 3) % length(LINE)
    }
    END {
        print TREES
    }'
