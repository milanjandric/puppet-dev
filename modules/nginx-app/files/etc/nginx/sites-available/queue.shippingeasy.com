server
{
    server_name queue.shippingeasy.com;

    root /var/www/shippingeasy.com/queue/web;
    access_log /var/log/nginx/queue.shippingeasy.com.log;
    error_log /var/log/nginx/queue.shippingeasy.com.err;

    location ~ \.php$
    {
        include /etc/nginx/fastcgi_params;
        fastcgi_pass unix:/var/run/php-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location /
    {
        index queue.php;
        try_files $uri $uri/ /queue.php$is_args$args;
    }

    location /backend_stage.php
    {
        try_files $uri $uri/ /backend_stage.php$is_args$args;
    }

    location /ebay-api.php
    {
        try_files $uri $uri/ /ebay-api.php$is_args$args;
    }

    location /api
    {
        try_files $uri $uri/ /rest_queue.php$is_args$args;
    }
}

