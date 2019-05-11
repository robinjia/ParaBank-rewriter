#!/bin/bash
set -eu -o pipefail
if [ "$#" -eq 0 ]
then
  echo "Usage: $0 source.txt target.txt" 2>&1
  exit 1
fi
src=$1
tgt=$2
MODEL_PATH=$(dirname $0)
BPE_CODES="$MODEL_PATH/bpe.codes"
BPE_VOCAB="$MODEL_PATH/bpe.vocab"

cat $src | python3 $MODEL_PATH/custom_constraints.py --BPE-codes $BPE_CODES --BPE-vocab $BPE_VOCAB | python3 extract_text.py > $src.bpe
cat $tgt | python3 $MODEL_PATH/custom_constraints.py --BPE-codes $BPE_CODES --BPE-vocab $BPE_VOCAB | python3 extract_text.py > $tgt.bpe
python3 -m sockeye.score \
    -m $MODEL_PATH \
    --source $src.bpe \
    --target $tgt.bpe \
    --batch-size 10 \
    --output-type pair_with_score
