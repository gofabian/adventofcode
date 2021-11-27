#!/bin/sh

set -e

cat 2020-05-input.txt | awk '
    BEGIN {
        MIN=999999999
        MAX=0
    }
    {
        BINARY=$0
        gsub("[BR]", "1", BINARY)
        gsub("[FL]", "0", BINARY)
        split(BINARY,BITS,"")

        DECIMAL=BITS[1]
        for (I=2; I<=length(BITS); I++)
        {
            DECIMAL=(DECIMAL * 2) + BITS[I]
        }

        if (DECIMAL < MIN)
            MIN=DECIMAL
        if (DECIMAL > MAX)
            MAX=DECIMAL
        
        SEATS[DECIMAL] = 1
    }
    END {
        for (I = MIN; I <= MAX; I++)
        {
            if (!(I in SEATS))
                print I
        }
    }'
