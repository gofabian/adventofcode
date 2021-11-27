#!/bin/sh

cat 2020-01-input.txt | awk '
    BEGIN {
    }
    {
        NUMBER=$1
        NUMBERS[NUMBER] = 1
    }
    END {
        for (N in NUMBERS)
        {
            REST = 2020 - N
            if (REST in NUMBERS)
                print N "*" REST "=" N*REST
        }
    }'
