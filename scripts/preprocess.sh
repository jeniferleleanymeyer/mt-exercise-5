#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

source_input=$base/data/train-it-en.it
source_output=$base/data/train.it

target_input=$base/data/train-it-en.en
target_output=$base/data/train.en

head -n 100000 $source_input > $source_output
head -n 100000 $target_input > $target_output

echo "cut off first 100k sentences done"