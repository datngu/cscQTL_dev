#!/bin/bash

in=$1

awk '{printf "%s\t%s\t%s\t%s:%s|%s\t.\t%s\n", $1, $2+1, $3, $1, $2+1, $3, $6}' $in