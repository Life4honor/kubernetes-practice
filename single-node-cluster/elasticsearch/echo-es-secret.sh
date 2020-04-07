#!/bin/bash

kubectl get secret quickstart-es-elastic-user -o json | jq '.["data"]["elastic"]' | sed s/\"//g | base64 --decode
