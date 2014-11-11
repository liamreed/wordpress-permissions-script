WP_OWNER=apache # <-- edit to the owner user you want
WP_GROUP=apache # <-- edit to the group you want
WP_ROOT=/var/www/html # <-- root directory of your wordpress install
WS_GROUP=nobody # <-- the group which the webserver belongs to
find ${WP_ROOT} -exec chown ${WP_OWNER}:${WP_GROUP} {} \;
find ${WP_ROOT} -type d -exec chmod 755 {} \;
find ${WP_ROOT} -type f -exec chmod 644 {} \;
chgrp ${WS_GROUP} ${WP_ROOT}/wp-config.php
chmod 660 ${WP_ROOT}/wp-config.php
touch ${WP_ROOT}/.htaccess
chgrp ${WS_GROUP} ${WP_ROOT}/.htaccess
chmod 664 ${WP_ROOT}/.htaccess
find ${WP_ROOT}/wp-content -exec chgrp ${WS_GROUP} {} \;
find ${WP_ROOT}/wp-content -type d -exec chmod 775 {} \;
find ${WP_ROOT}/wp-content -type f -exec chmod 664 {} \;
