    root /var/www/vpn.shippingeasy.com/daily/current/web;

    location ~ \.php$
    {
        include /etc/nginx/fastcgi_params;
        fastcgi_pass unix:/var/run/php-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location /
    {
        index daily_vpn.php;
        try_files $uri $uri/ /daily_vpn.php$is_args$args;
    }

    location /backend_daily_vpn.php
    {
        try_files $uri $uri/ /backend_daily_vpn.php$is_args$args;
    }

    location /ebay-api-daily_vpn.php
    {
        try_files $uri $uri/ /ebay-api-daily_vpn.php$is_args$args;
    }

    location /api
    {
        try_files $uri $uri/ /rest_daily_vpn.php$is_args$args;
    }

    location /cms_daily.php
    {
        try_files $uri $uri/ /cms_daily.php$is_args$args;
    }
