#!/bin/bash


apt-get clean && apt-get update

apt-get install -y gcc

git clone https://github.com/jgawrilo/butler_server.git

pip install --upgrade pip

conda update setuptools

# Install python requirements
cd butler_server

cat <<EOT >> config.json
{
    "es":"http://elastic:9200/",
    "nlp_service":"http://coreNLP:9000",
    "port":5000,
    "platform":"Linux",
    "butler_index":"butler",
    "page_threads":1,
    "start_num_pages":1,
    "silos":[],
    "star_search_url":"https://api",
    "star_search":false,
    "star_search_auth_u":"user",
    "star_search_auth_p":"pass",
    "chrome_loc":"/usr/bin/google-chrome",
    "cdr_search":false,
    "cdr_url":"https://api",
    "cdr_u":"uname",
    "cdr_p":"pass",
    "search_boxes":[],
    "reg_key":"",
}
EOT

pip install -r requirements.txt
./nltk.sh

pip install --upgrade beautifulsoup4

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

apt-get update
apt-get install -y google-chrome-stable

apt-get install -y xvfb

apt-get install -y unzip

wget -N http://chromedriver.storage.googleapis.com/2.29/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
chmod +x chromedriver

mv -f chromedriver /usr/local/share/chromedriver
ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

