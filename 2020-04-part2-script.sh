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
            "hgt" in FIELDS &&
            FIELDS["byr"] >= 1920 && 
            FIELDS["byr"] <= 2002 &&
            FIELDS["iyr"] >= 2010 && 
            FIELDS["iyr"] <= 2020 &&
            FIELDS["eyr"] >= 2020 && 
            FIELDS["eyr"] <= 2030 &&
            FIELDS["hcl"] ~ /^#[0-9a-f]{6}$/ &&
            FIELDS["ecl"] ~ /^(amb|blu|brn|gry|grn|hzl|oth)$/ &&
            FIELDS["pid"] ~ /^[0-9]{9}$/ &&
            1 == 1)
        {
            HEIGHT=FIELDS["hgt"]
            if (HEIGHT ~ /cm$/)
            {
                VALUE = substr(HEIGHT, 1, length(HEIGHT)-2)
                if (VALUE >= 150 && VALUE <= 193)
                    VALID++
            }
            if (HEIGHT ~ /in$/)
            {
                VALUE = substr(HEIGHT, 1, length(HEIGHT)-2)
                if (VALUE >= 59 && VALUE <= 76)
                    VALID++
            }
        }
    }
    END {
        print VALID
    }'
