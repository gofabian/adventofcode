#!/bin/sh

set -e

cat 2020-05-input.txt | awk '
    BEGIN {
        
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

        print DECIMAL
        
    }
    END {
        
    }' | sort -r | head -n 1
