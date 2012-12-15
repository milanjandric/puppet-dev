server
{
    server_name ecommerce.vpn.shippingeasy.com;

    root /var/www/vpn.shippingeasy.com/ecommerce/web;
    access_log /var/log/nginx/ecommerce.vpn.shippingeasy.com.log;
    error_log /var/log/nginx/ecommerce.vpn.shippingeasy.com.err;

    location ~ \.php$
    {
        include /etc/nginx/fastcgi_params;
        fastcgi_pass unix:/var/run/php-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}

