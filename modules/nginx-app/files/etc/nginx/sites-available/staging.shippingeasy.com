server
{
    server_name staging.shippingeasy.com;

    root /var/www/shippingeasy.com/staging/current/web;
    access_log /var/log/nginx/staging.shippingeasy.com.log;
    error_log /var/log/nginx/staging.shippingeasy.com.err;

    location ~ \.php$
    {
        include /etc/nginx/fastcgi_params;
        fastcgi_pass unix:/var/run/php-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location /api
    {
        try_files $uri $uri/ /rest_stage.php$is_args$args;
    }
}
