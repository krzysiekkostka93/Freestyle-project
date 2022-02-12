#!/bin/bash

n=10

if [ $n -lt 10 ];
	then
	echo "To liczba jednocyfrowa"
elif [ $n -lt 100 ]; then
	echo "To liczba dwucyfrowa"
else
	echo "To liczba trzy lub wiecej cyfrowa"
fi
