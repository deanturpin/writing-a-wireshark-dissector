#!/bin/bash

echo $0

# Quiet(er)
# Loopback
# Hex
# Only our port
sudo tcpdump -q -i lo -X -n dst port 9999
