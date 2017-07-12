# Core NLP Service
cd docker-butler_corenlp
docker build -t mycorenlp .

# Butler Server
cd ../docker-butler_server
docker build -t butler_server .

docker run -d -p 9000:9000 --name coreNLP -t mycorenlp

sleep 5

wget --post-data 'The quick brown fox jumped over the lazy dog.' 'localhost:9000/?properties={"annotators":"tokenize,ssplit,pos,ner,depparse,openie","outputFormat":"json"}' -O -

sleep 30

docker run -d -p 5000:5000 --link coreNLP -t --name butler_s butler_server

docker stop butler_s coreNLP
