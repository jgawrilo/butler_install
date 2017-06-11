
apt-get update

apt-get install -y nodejs
apt-get install -y npm
apt-get install -y git
apt-get install -y curl
npm install -g n
n stable

git clone https://bitbucket.org/blueridgedynamics/butler.git
cd butler
npm install -g bower gulp
npm install
bower install --allow-root
gulp build