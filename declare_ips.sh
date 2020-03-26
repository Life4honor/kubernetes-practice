#!/bin/bash

declare -a IPS=(192.168.0.10 192.168.0.2 192.168.0.3 192.168.0.4)

echo ${IPS[@]} > hosts
