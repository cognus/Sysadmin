#!/bin/bash

for i in bpl{,/scripts,/bin}
do
    `mkdir -p $i`
#    echo $i
done
exit 0
