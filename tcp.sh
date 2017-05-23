#!/bin/bash

# while read line < <(tcpdump -i lo -n dst port 9999); do
while read line; do

	# 127.0.0.1.48274 > 127.0.0.1.9999
	[[ $line =~ ([^\ ]+)(\ [\<\>]\ )([^\ ]+) ]] && echo ${BASH_REMATCH[1]} ${BASH_REMATCH[2]} ${BASH_REMATCH[3]} || echo "// $line"
done
