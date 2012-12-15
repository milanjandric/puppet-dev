server
{
    server_name www.vpn.shippingeasy.com;

    root /var/www/shippingeasy.com/www/current/web;
    access_log /var/log/nginx/www.vpn.shippingeasy.com.log;
    error_log /var/log/nginx/www.vpn.shippingeasy.com.err;

    location ~ \.php$
    {
        include /etc/nginx/fastcgi_params;
        fastcgi_pass unix:/var/run/php-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location /
    {
        index index_vpn.php;
        try_files $uri $uri/ /index_vpn.php$is_args$args;
    }

    location /backend_vpn.php
    {
        try_files $uri $uri/ /backend_vpn.php$is_args$args;
    }

    location /backend.php
    {
        try_files $uri $uri/ /backend.php$is_args$args;
    }

    location /ebay-api.php
    {
        try_files $uri $uri/ /ebay-api-stage.php$is_args$args;
    }

    location /api
    {
        try_files $uri $uri/ /rest_prod_vpn.php$is_args$args;
    }

    location /cms.php
    {
        try_files $uri $uri/ /cms.php$is_args$args;
    }
}
