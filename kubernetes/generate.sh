#!/usr/bin/env bash

key_dir="$1"
echo "$key_dir"
mkdir $key_dir
chmod 0700 "$key_dir"
cd $key_dir
USAGE="generate.sh CAName CN"
openssl req -days 800 -nodes -new -x509 -keyout $1.key -out $1.crt -subj "/CN=$1"
openssl genrsa  -out $2.key 2048
openssl req -days 800 -new -key $2.key -subj "/CN=$2" \
    | openssl x509 -req -CA $1.crt -CAkey $1.key -CAcreateserial -out $2.crt
