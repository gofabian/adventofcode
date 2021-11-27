#!/bin/sh

cat 2020-02-input.txt | awk '
    BEGIN { 
        FS = "[ :-]+"
        VALID = 0
    }
    { 
        MIN=$1
        MAX=$2
        CHAR=$3
        PW=$4

        r = "[^" CHAR "]"
        gsub(r,"",PW)
        COUNT = length(PW)

        if (COUNT >= MIN && COUNT <= MAX)
            VALID++
    }
    END {
        print VALID
    }'
