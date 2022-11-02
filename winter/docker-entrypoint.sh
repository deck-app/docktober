#!/bin/bash
set +x

if [[ -f "/var/www/composer.json" ]] ;
then
    cd /var/www/
    if [[ -d "/var/www/vendor" ]] ;
    then
        echo "Steps to use Composer optimise autoloader"
        composer update --prefer-dist --no-interaction --optimize-autoloader --no-dev
        echo "Steps to Clear All Development inputs"
        php artisan view:clear
        php artisan route:clear
        php artisan config:clear
        php artisan clear-compiled
    else
        echo "If composer vendor folder is not installed follow the below steps"
        composer install --prefer-dist --no-interaction --optimize-autoloader --no-dev
    fi

fi
if [[ "$(ls -A "/var/www/")" ]] ;
    then
        echo "If the Directory is not empty, please delete the hidden files and directory"
    else
        # git clone https://github.com/octobercms/install.git .
        composer create-project wintercms/winter . "dev-develop"
        php artisan winter:env
        cp -a /app/app.env /var/www/.env
        HOST=`hostname`
        NAME=`echo $HOST | cut -c9-`
        #HOST_NAME = echo "`hostname`" | sed 's:.*-::'
        sed -i "s/{DB_HOSTNAME}/$NAME/g" /var/www/.env
        php artisan winter:up
fi

if [[ {BACK_END} = nginx ]] ;
then
    cp /app/default.conf /etc/nginx/conf.d/default.conf
    php artisan winter:passwd admin {ADMIN_PASSWD}
    nginx -s reload
    chown -R nobody:nobody /var/www 2> /dev/null
else
    cp /app/httpd.conf /etc/apache2/httpd.conf
    php artisan winter:passwd admin {ADMIN_PASSWD}
    httpd -k graceful
    chown -R apache:apache /var/www 2> /dev/null
fi

rm -rf /var/preview

exec "$@"