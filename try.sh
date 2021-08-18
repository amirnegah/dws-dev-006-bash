#!/bin/bash

ARGS=( "$@" )

for i in "${!ARGS[@]}"; do
        case "${ARGS[i]}" in
                    '') 
                    continue
                ;;
                -n)
                    number="${ARGS[i+1]}"
                    unset 'ARGS[i+1]'
                ;;
                -i)
                    interval="${ARGS[i+1]}"
                    unset 'ARGS[i+1]'
                ;;
                *)
                    continue
                ;;
        esac
        unset 'ARGS[i]'
done

if [ -z $number ] || [ -z $interval ]; then
	>&2 echo "parameter is invalid" 
	exit 1
fi

echo "Interval:" $interval
echo "Number:" $number

for ((n=1;n<=$number;n++)); do
	${ARGS[@]} 2>/dev/null
	if [ $? != 0 ]; then
		echo $n "attempt fialed"
		if [ $n -lt $number ]; then
		sleep $interval
		fi
	else
		break
	fi
done
