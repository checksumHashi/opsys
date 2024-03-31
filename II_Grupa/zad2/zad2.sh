#!/bin/bash

out=$(stat $1 | grep Birth)

cutout=${out:8:10}

echo $cutout | awk -F'-' '{print $3"-"$2"-"$1}'
