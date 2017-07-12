echo 'Starting CoreNLP.'
docker start coreNLP

sleep 5

wget --post-data 'The quick brown fox jumped over the lazy dog.' 'localhost:9000/?properties={"annotators":"tokenize,ssplit,pos,ner,depparse,openie","outputFormat":"json"}' -O -

sleep 30

echo 'Starting Butler Server.'
docker start butler_s

echo 'Done!'
