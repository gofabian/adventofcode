#!/bin/sh

cat 2020-01-input.txt | awk '
    BEGIN {
    }
    {
        NUMBER=$1
        NUMBERS[NUMBER] = 1
    }
    END {
        for (N1 in NUMBERS)
            for (N2 in NUMBERS)
                for (N3 in NUMBERS)
                    if (N1 + N2 + N3 == 2020)
                    {
                        print N1 "+" N2 "+" N3 "=2020"
                        print N1 "*" N2 "*" N3 "=" N1*N2*N3
                    }
    }'
