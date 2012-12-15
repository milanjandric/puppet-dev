server
{
    server_name staging.vpn.shippingeasy.com;

    root /var/www/shippingeasy.com/staging/current/web;
    access_log /var/log/nginx/staging.vpn.shippingeasy.com.log;
    error_log /var/log/nginx/staging.vpn.shippingeasy.com.err;

    location ~ \.php$
    {
        include /etc/nginx/fastcgi_params;
        fastcgi_pass unix:/var/run/php-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location /
    {
        index stage_vpn.php;
        try_files $uri $uri/ /stage_vpn.php$is_args$args;
    }

    location /backend_stage_vpn.php
    {
        try_files $uri $uri/ /backend_stage_vpn.php$is_args$args;
    }

    location /ebay-api-stage.php
    {
        try_files $uri $uri/ /ebay-api-stage.php$is_args$args;
    }

    location /api
    {
        try_files $uri $uri/ /rest_stage_vpn.php$is_args$args;
    }

    location /cms_stage_vpn.php
    {
        try_files $uri $uri/ /cms_stage_vpn.php$is_args$args;
    }
}
