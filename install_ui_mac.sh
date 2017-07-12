git clone https://bitbucket.org/blueridgedynamics/butler.git
cd butler

cat <<EOT > config.js
const path = require('path');

module.exports = {
  LANGUAGES: [
    {
      language: 'english',
      display: 'English',
      flag: 'us'
    }
  ],
  SERVER_PORT: 3000,
  REMOTE_HOST: 'butler_s',
  REMOTE_PORT: 5000,
  REMOTE_HTTPS_ENABLED: false,
  REMOTE_AUTHORIZATION: {
    USERNAME: '',
    PASSWORD: ''
  },
  SESSION_EXPIRES: 86400,
  PROJECTS_DIR: path.join(__dirname, '../butler/contrib/saves'),
  PROJECTS_DIR_BLACKLIST: [
    '.DS_Store'
  ],
  REQUEST_TIMEOUT: 1.8e+6,
  VIS_TREEMAP_MODE: 'binary' // valid options are: squarify, resquarify, slice, dice, slicedice, binary, circlePack, partition, partition-pivot
};
EOT

npm install -g bower gulp
npm install
bower install --allow-root
gulp build