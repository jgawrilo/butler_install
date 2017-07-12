# Butler Docker Installation (includes corenlp, elasticsearch, butler server, and butler ui)
## Requires Docker -  https://docs.docker.com/engine/installation/
```
# To install
git clone https://github.com/jgawrilo/butler_install.git
cd butler_install
./install.sh

# To start
./start.sh

# head to localhost:3000 in browser

# To stop
./stop.sh
```
# Butler Installation - partial Docker / partial local (includes corenlp, butler server, and butler ui installed locally)
## Requires NPM - https://nodejs.org/en/download/
```
# To install
git clone https://github.com/jgawrilo/butler_install.git
cd butler_install
# EDIT 
./mini_install.sh

# To start
./mini_start.sh

# head to localhost:3000 in browser

# To stop
./mini_stop.sh
```
