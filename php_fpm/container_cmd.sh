#!/bin/sh
# chown -R php /var/www
chgrp -R http /var/www

# Only run this part if extracted moodle files, configured config.php, and got db and webserver config ready. Then put this echo statement in the cronjob
# crond
# echo "* * * * *    /usr/bin/php /var/www/moodle/wwwroot/moodle/admin/cli/cron.php" >/dev/null

# Start container
php-fpm7 -F
