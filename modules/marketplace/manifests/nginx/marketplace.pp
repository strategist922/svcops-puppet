# defines a marketplace nginx config
define marketplace::nginx::marketplace(
    $server_names, # ['marketplace.firefox.com', 'telefonica.marketplace.mozilla.org']
    $cdn_server_names, # ['marketplace-static.addons.mozilla.net']
    $https_redirect_names, # ['marketplace.mozilla.org', 'marketplace.firefox.com', 'marketplace-static.addons.mozilla.net', 'telefonica.marketplace.mozilla.org']
    $https_redirect_to, # marketplace.firefox.com
    $webroot, # /data/www/addons.mozilla.org
    $webpayroot, # /data/www/marketplace.firefox.com-webpay,
    $cdn_hostname, # marketplace.cdn.mozilla.net
    $netapp_root, # /mnt/netapp_amo/addons.mozilla.org
    $marketplace_gunicorn_name = 'marketplace',
    $webpay_gunicorn_name = 'webpay-marketplace',
    $fireplace_root = '',
    $commbadge_root = '',
    $rocketfuel_root = ''

) {
    $config_name = $name

    if $fireplace_root {
        $fireplace_webroot = $fireplace_root
    } else {
        $fireplace_webroot = $webroot
    }

    if $commbadge_root {
        $commbadge_webroot = $commbadge_root
    } else {
        $commbadge_webroot = $webroot
    }

    if $rocketfuel_root {
        $rocketfuel_webroot = $rocketfuel_root
    } else {
        $rocketfuel_webroot = $webroot
    }

    nginx::config {
        $config_name:
            content => template('marketplace/nginx/marketplace.conf');
    }

    nginx::logdir {
        $config_name:;
    }
}
