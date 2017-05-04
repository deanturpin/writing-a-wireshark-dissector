#!/bin/bash

echo $0

xxd -r -p <<< '0108 5556 5758' > /dev/tcp/127.0.0.1/9999
