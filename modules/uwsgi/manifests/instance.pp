# uwsgi instance.
define uwsgi::instance(
    $app_dir,
    $module,
    $port,
    $home, # point at venv
    $user,
    $workers = 4,
    $environ = ''
) {
    include uwsgi

    $app_name = $name
    file {
        "${uwsgi::conf_dir}/${app_name}.ini":
            content => template('uwsgi/uwsgi.ini');
    }
    supervisord::service {
        "uwsgi-${app_name}":
            require            => File["${uwsgi::conf_dir}/${app_name}.ini"],
            command            => "/usr/bin/uwsgi ${uwsgi::conf_dir}/${app_name}.ini",
            app_dir            => $app_dir,
            environ            => $environ,
            user               => $user;
    }

    nginx::upstream {
        "uwsgi_${app_name}":
            upstream_host => '127.0.0.1',
            upstream_port => $port;
    }

    motd {
        "2-uwsgi-${app_name}":
            order   => 12,
            content => "    ${app_name} is hosted at uwsgi://127.0.0.1:${port}/ (${app_dir})\n";
    }
}
