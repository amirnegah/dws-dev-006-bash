#!/bin/bash

DEFAULT_INTERVAL='5'
DEFAULT_NUMBER='12'

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

if [ -z $interval ]; then
	if [ -z $TRY_INTERVAL ]; then
		interval=$DEFAULT_INTERVAL
	else
		interval=$TRY_INTERVAL
	fi
fi

if [ -z $number ]; then
	if [ -z $TRY_NUMBER ]; then
		number=$DEFAULT_NUMBER
	else
		number=$TRY_NUMBER
	fi
fi

echo "Interval:" $interval
echo "Number:" $number

for ((x=1;x<=$number;x++)); do
	${ARGS[@]} 2>/dev/null
	if [ $? != 0 ]; then
		echo $x "attempt fialed"
		if [ $x -lt $number ]; then
		sleep $interval
		fi
	else
		break
	fi
done
