#!/bin/bash

exec &> salidafor.log

for i in /usr/local/scripts/perl
do
    if [ "$i" ]
    then
        ls -F $i
    fi
done

