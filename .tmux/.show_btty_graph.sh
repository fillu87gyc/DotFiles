#!/bin/bash
DIR=`~/dotfiles/bin/sh/mybattery -ep`
battery=`echo $DIR \* 0.16 | bc`
battery=$(printf "%.0f" $battery)
str=""
for ((i=0; i < $battery; i++ )); do
  str="${str}■"
done
for ((i=$battery; i < 16; i++ )); do
  str="${str} "
done
graph="#[bold][${str}]#[default]"
echo $graph