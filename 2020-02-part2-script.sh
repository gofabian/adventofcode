#!/bin/sh

cat 2020-02-input.txt | awk '
    BEGIN { 
        FS = "[ :-]+"
        VALID = 0
    }
    { 
        FIRST=$1
        SECOND=$2
        CHAR=$3
        PW=$4

        PW = substr(PW, FIRST, 1) substr(PW, SECOND, 1)

        r = "[^" CHAR "]"
        gsub(r,"",PW)
        COUNT = length(PW)

        if (COUNT == 1)
            VALID++
    }
    END {
        print VALID
    }'
