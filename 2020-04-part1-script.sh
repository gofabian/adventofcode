#!/bin/sh

set -e

cat 2020-04-input.txt | awk '
    BEGIN {
        RS = "\n\n"
        FS = "[\n ]"
        VALID = 0
    }
    {
        delete FIELDS

        for (i = 1; i <= NF; i++)
        {
            split($i,KV,":")
            FIELDS[KV[1]] = KV[2]
        }
        
        if ("ecl" in FIELDS &&
            "pid" in FIELDS &&
            "eyr" in FIELDS &&
            "hcl" in FIELDS &&
            "byr" in FIELDS &&
            "iyr" in FIELDS &&
            "hgt" in FIELDS)
        {
            VALID++
        }
    }
    END {
        print VALID
    }'
