# defines gunicorn instance.
define gunicorn::instance (
    $port,
    $appmodule,
    $appdir,
    $gunicorn = '/usr/bin/gunicorn',
    $workers = '4',
    $worker_class = 'sync',
    $max_requests = '5000',
    $timeout = '30',
    $environ = '',
    $nginx_upstream = true,
    $user = 'nginx',
    $preload = false,
    $use_pid_proxy = false
) {
    include gunicorn
    include supervisord::base

    $app_name = $name
    $log_file = "${gunicorn::log_dir}/${user}-${app_name}"
    $gunicorn_timeout = $timeout
    $pid_file = "${gunicorn::pid_dir}/${app_name}.pid"

    if($nginx_upstream) {
        nginx::upstream {
            "gunicorn_${app_name}":
                upstream_host => '127.0.0.1',
                upstream_port => $port;
        }
    }

    if $environ {
        $_environ = "${environ},GUNICORN_APP_DIR=${appdir}"
    } else {
        $_environ = "GUNICORN_APP_DIR=${appdir}"
    }

    if $use_pid_proxy {
        $cmd = "/usr/bin/pidproxy ${pid_file} ${gunicorn}"
    } else {
        $cmd = $gunicorn
    }

    file {
        "${gunicorn::conf_dir}/${app_name}":
            require => File[$gunicorn::pid_dir],
            content => template('gunicorn/gunicorn.conf');
    }

    supervisord::service {
        "gunicorn-${app_name}":
            require            => File["${gunicorn::conf_dir}/${app_name}"],
            command            => "${cmd} -c '${gunicorn::conf_dir}/${app_name}' ${appmodule}",
            app_dir            => $appdir,
            environ            => $_environ,
            configtest_command => "cd ${appdir}; ${gunicorn} --check-config ${appmodule}",
            user               => $user;
    }

    motd {
        # this is intended to follow 20-gunicorn in webapp::gunicorn
        "1-gunicorn-${app_name}":
            order   => '11',
            content => "    ${app_name} is hosted at http://127.0.0.1:${port}/ (${appdir})\n";
    }
}
