#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

merges1=2000

src=it
trg=en

code_file1=$base/data/bpe_$merges1.bpe

subword-nmt learn-joint-bpe-and-vocab --input $base/data/train.$src $base/data/train.$trg \
    -s $merges1 -o $code_file1 \
    --write-vocabulary $base/data/vocabulary_size_$merges1.$src $base/data/vocabulary_size_$merges1.$trg

subword-nmt apply-bpe -c $code_file1 < $base/data/train.$src > $base/data/train_BPE_$merges1.$src
subword-nmt apply-bpe -c $code_file1 < $base/data/train.$trg > $base/data/train_BPE_$merges1.$trg

cat $base/data/train_BPE_$merges1.$src $base/data/train_BPE_$merges1.$trg > $base/data/BPE_vocabulary_$merges1.bpe

subword-nmt get-vocab -i $base/data/BPE_vocabulary_$merges1.bpe -o $base/data/BPE_vocabulary_$merges1.txt

echo "vocabulary $merges1 files done"

########################################################################

merges2=5000

code_file2=$base/data/bpe_$merges2.bpe

subword-nmt learn-joint-bpe-and-vocab --input $base/data/train.$src $base/data/train.$trg \
    -s $merges2 -o $code_file2 \
    --write-vocabulary $base/data/vocabulary_size_$merges2.$src $base/data/vocabulary_size_$merges1.$trg

subword-nmt apply-bpe -c $code_file2 < $base/data/train.$src > $base/data/train_BPE_$merges2.$src
subword-nmt apply-bpe -c $code_file2 < $base/data/train.$trg > $base/data/train_BPE_$merges2.$trg

cat $base/data/train_BPE_$merges1.$src $base/data/train_BPE_$merges2.$trg > $base/data/BPE_vocabulary_$merges2.bpe

subword-nmt get-vocab -i $base/data/BPE_vocabulary_$merges2.bpe -o $base/data/BPE_vocabulary_$merges2.txt

echo "vocabulary $merges2 files done"

########################################################################

python3 scripts/clean_vocabulary.py