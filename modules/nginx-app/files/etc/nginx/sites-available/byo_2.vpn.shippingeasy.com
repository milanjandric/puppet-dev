server
{
    server_name mystores2.vpn.shippingeasy.com;

    root /var/www/vpn.shippingeasy.com/byo_2/current/web;
    access_log /var/log/nginx/byo_2.vpn.shippingeasy.com.log;
    error_log /var/log/nginx/byo_2.vpn.shippingeasy.com.err;

    location ~ \.php$
    {
        include /etc/nginx/fastcgi_params;
        fastcgi_pass unix:/var/run/php-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location /
    {
        index byo2.php;
        try_files $uri $uri/ /byo2.php$is_args$args;
    }

    location /backend_byo2.php
    {
        try_files $uri $uri/ /backend_byo2.php$is_args$args;
    }

    location /ebay-api-daily_vpn.php
    {
        try_files $uri $uri/ /ebay-api-daily_vpn.php$is_args$args;
    }

    location /api
    {
        try_files $uri $uri/ /rest_byo2.php$is_args$args;
    }
}

