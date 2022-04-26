FILE=./data.csv
if test -f "$FILE";
then
    echo "The original file $FILE is already obtained."
else
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1ZYstHM4pd5gEIqo0-DM8CmA27uG61wcu' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1ZYstHM4pd5gEIqo0-DM8CmA27uG61wcu" -O data.csv && rm -rf /tmp/cookies.txt
fi

# 14: time, 16: latitude, 16: longitude, 
# 21: depth, 23: magnitude, 28: distance
# cat data.csv \
#     | sort -t , -n -k 23 \
#     | cut -d, -f14,16,17,21,23,28 > data_sorted.csv

FILE_SEP=./data.csv.00
if test -f "$FILE_SEP";
then
    echo "The split file $FILE_SEP is already obtained."
    # rm data.csv
    sed -i '1d' $FILE_SEP
else
  nProcessors=50
  data="data.csv"
  nDataLines=$(wc -l < $data)
  nLinesPerSplitFile=$(($nDataLines / $nProcessors))
  remainder=$(($nDataLines % $nProcessors))
  if [[ $remainder > 0 ]]; then
    nLinesPerSplitFile=$(($nLinesPerSplitFile + 1))
  fi
  split -d -l $nLinesPerSplitFile $data "$data."
fi

mkdir log
mkdir error
mkdir output

