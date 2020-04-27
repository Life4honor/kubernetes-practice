#!/bin/bash

kubectl get secret elasticsearch-es-elastic-user -o json | jq '.["data"]["elastic"]' | sed s/\"//g | base64 --decode
