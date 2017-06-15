git clone https://github.com/jgawrilo/butler_install.git

cd butler_install

# Core NLP Service
cd docker-butler_corenlp
docker build -t mycorenlp:mycorenlp .

# Elasticsearch
docker pull docker.elastic.co/elasticsearch/elasticsearch:5.4.1

# Butler Server
cd ../docker-butler_server
docker build -t butler_server:butler_server .

# Butler Web App
cd ../docker-butler_app
docker build -t butler_app:butler_app .