import datetime

AES_KEYS = {
    'api:access:secret': '<%= api_secret_key %>',
}
AWS_ACCESS_KEY_ID = '<%= aws_access_key_id %>'
AWS_SECRET_ACCESS_KEY = '<%= aws_secret_access_key %>'
AWS_STORAGE_BUCKET_NAME = '<%= aws_storage_bucket_name %>'
BROKER_URL = '<%= broker_url %>'
BUILDER_SECRET_KEY = '<%= builder_secret_key %>'
CACHES_DEFAULT_LOCATION = '<%= caches_default_location %>'
DATABASES_DEFAULT_URL = '<%= databases_default_url %>'
DATABASES_SLAVE_URL = '<%= databases_slave_url %>'
EMAIL_BLACKLIST = '<%= email_blacklist %>'.split(';')
EMAIL_HOST = '<%= email_host %>'
ES_HOSTS = '<%= es_hosts %>'
GOOGLE_ANALYTICS_CREDENTIALS = <%= google_analytics_credentials %>
GRAPHITE_HOST = '<%= graphite_host %>'
GRAPHITE_PORT = <%= graphite_port %>
GRAPHITE_PREFIX = '<%= graphite_prefix %>'
METLOG_CONF_SENDER_HOST = '<%= metlog_conf_sender_host %>'
METLOG_CONF_SENDER_PORT = <%= metlog_conf_sender_port %>
NETAPP_STORAGE_ROOT = '<%= netapp_storage_root %>'
RECAPTCHA_PRIVATE_KEY = '<%= recaptcha_private_key %>'
RECAPTCHA_PUBLIC_KEY = '<%= recaptcha_public_key %>'
REDIRECT_SECRET_KEY = '<%= redirect_secret_key %>'
REDIS_BACKENDS_CACHE = '<%= redis_backends_cache %>'
REDIS_BACKENDS_CACHE_SLAVE = '<%= redis_backends_cache_slave %>'
REDIS_BACKENDS_MASTER = '<%= redis_backends_master %>'
REDIS_BACKENDS_SLAVE = '<%= redis_backends_slave %>'
RESPONSYS_ID = '<%= responsys_id %>'
SECRET_KEY = '<%= secret_key %>'
SERVICES_DATABASE_URL = '<%= services_database_url %>'
STATSD_HOST = '<%= statsd_host %>'
STATSD_PORT = <%= statsd_port %>
STATSD_PREFIX = '<%= statsd_prefix %>'
