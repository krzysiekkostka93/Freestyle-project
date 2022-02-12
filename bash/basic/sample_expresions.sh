#!/bin/bash

# usage: ./sample_expresions.sh 1 1

((sum=$1+$2))

echo "Sum: $sum"

sub=($1 - $2)

echo "Subtraction: $sub"
