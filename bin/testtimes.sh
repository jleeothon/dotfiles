#!/usr/bin/env bash

for i in $(seq 20)
do
	echo $i - $@
	if $@ &> "testresults-$i.log"
	then
		echo "$i good ✅"
	else
		echo "$i fail ❌"
	fi
	sleep 10
done
