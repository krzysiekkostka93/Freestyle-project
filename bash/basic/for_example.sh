#!/bin/bash

for (( counter=10; counter>0; counter-- ))
do
	echo -n "$counter "
	touch isa_tmp/file_$counter.csv
done

printf "\n"
