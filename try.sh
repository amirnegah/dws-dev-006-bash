#!/bin/bash


	
for ((x=1;x<=$4;x++)); do
	${@:5} 2>/dev/null
	if [ $? != 0 ]; then
		echo $x "attempt fialed"
		if [ $x -lt $4 ]; then
		sleep $2
		fi
	else
		break
	fi
done
