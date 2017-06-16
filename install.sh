# Core NLP Service
cd docker-butler_corenlp
docker build -t mycorenlp .

# Elasticsearch
docker pull docker.elastic.co/elasticsearch/elasticsearch:5.4.1

# Butler Server
cd ../docker-butler_server
docker build -t butler_server .

# Butler Web App
cd ../docker-butler_app
docker build -t butler_app .

docker run -d -p 9200:9200 -e "http.host=0.0.0.0" -e "transport.host=127.0.0.1" -e "xpack.security.enabled=false" --name elastic docker.elastic.co/elasticsearch/elasticsearch:5.4.1

docker run -d -p 9000:9000 --name coreNLP -t mycorenlp

sleep 5

wget --post-data 'The quick brown fox jumped over the lazy dog.' 'localhost:9000/?properties={"annotators":"tokenize,ssplit,pos,ner,depparse,openie","outputFormat":"json"}' -O -

sleep 30

docker run -d -p 5000:5000 --link elastic --link coreNLP -t --name butler_s butler_server

docker run -d -it -p 3000:3000 --link butler_s --name butler_a butler_app

sleep 10

docker stop butler_a butler_s coreNLP elastic
