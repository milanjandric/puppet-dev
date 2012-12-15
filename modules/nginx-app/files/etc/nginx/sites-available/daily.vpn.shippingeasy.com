server
{
    server_name daily.vpn.shippingeasy.com;

    access_log /var/log/nginx/daily.vpn.shippingeasy.com.log;
    error_log /var/log/nginx/daily.vpn.shippingeasy.com.err;

    include /etc/nginx/sites-available/daily.vpn.shippingeasy.com.inc;
}

server
{
    server_name daily-asset.vpn.shippingeasy.com;

    listen 443;
    ssl on;
    ssl_certificate      /etc/nginx/ssl/wildcard.vpn.shippingeasy.com.crt;
    ssl_certificate_key  /etc/nginx/ssl/wildcard.vpn.shippingeasy.com.key;

    access_log /var/log/nginx/daily-asset.vpn.shippingeasy.com.log;
    error_log /var/log/nginx/daily-asset.vpn.shippingeasy.com.err;

    include /etc/nginx/sites-available/daily.vpn.shippingeasy.com.inc;
}
