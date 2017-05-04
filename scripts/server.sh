#!/bin/bash

echo $0

nc -kl 9999 | xxd -c 6 
