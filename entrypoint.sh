#!/bin/sh
# Here are some parameters. See all on
# https://pgbouncer.github.io/config.html

PG_LOG=/var/log/pgbouncer
PG_CONFIG_DIR=/etc/pgbouncer
PG_USER=postgres

if [ ! -f ${PG_CONFIG_DIR}/pgbouncer.ini ]; then
  echo "create pgbouncer config in ${PG_CONFIG_DIR}"
  mkdir -p ${PG_CONFIG_DIR}

  printf "\
#pgbouncer.ini
# Description
# Config file is in “ini” format. Section names are between “[” and “]”.
# Lines starting with “;” or “#” are taken as comments and ignored.
# The characters “;” and “#” are not recognized when they appear later in the line.
[databases]
${DB_1_NAME} = host=${DB_1_HOST} port=${DB_1_PORT:-5432} dbname=${DB_1_NAME} user=${DB_1_USER:-postgres} ${DB_1_PASSWORD:+password=${DB_1_PASSWORD}\n}\
${DB_2_NAME:+${DB_2_NAME} = host=${DB_2_HOST} port=${DB_2_PORT:-5432} dbname=${DB_2_NAME} user=${DB_2_USER:-postgres} ${DB_2_PASSWORD:+password=${DB_2_PASSWORD}}\n} \
${DB_3_NAME:+${DB_3_NAME} = host=${DB_3_HOST} port=${DB_3_PORT:-5432} dbname=${DB_3_NAME} user=${DB_3_USER:-postgres} ${DB_3_PASSWORD:+password=${DB_3_PASSWORD}}\n} \
${DB_4_NAME:+${DB_4_NAME} = host=${DB_4_HOST} port=${DB_4_PORT:-5432} dbname=${DB_4_NAME} user=${DB_4_USER:-postgres} ${DB_4_PASSWORD:+password=${DB_4_PASSWORD}}\n} \
${DB_5_NAME:+${DB_5_NAME} = host=${DB_5_HOST} port=${DB_5_PORT:-5432} dbname=${DB_5_NAME} user=${DB_5_USER:-postgres} ${DB_5_PASSWORD:+password=${DB_5_PASSWORD}}\n} \
${DB_6_NAME:+${DB_6_NAME} = host=${DB_6_HOST} port=${DB_6_PORT:-5432} dbname=${DB_6_NAME} user=${DB_6_USER:-postgres} ${DB_6_PASSWORD:+password=${DB_6_PASSWORD}}\n} \
${DB_7_NAME:+${DB_7_NAME} = host=${DB_7_HOST} port=${DB_7_PORT:-5432} dbname=${DB_7_NAME} user=${DB_7_USER:-postgres} ${DB_7_PASSWORD:+password=${DB_7_PASSWORD}}\n} \
${DB_8_NAME:+${DB_8_NAME} = host=${DB_8_HOST} port=${DB_8_PORT:-5432} dbname=${DB_8_NAME} user=${DB_8_USER:-postgres} ${DB_8_PASSWORD:+password=${DB_8_PASSWORD}}\n} \
${DB_9_NAME:+${DB_9_NAME} = host=${DB_9_HOST} port=${DB_9_PORT:-5432} dbname=${DB_9_NAME} user=${DB_9_USER:-postgres} ${DB_9_PASSWORD:+password=${DB_9_PASSWORD}}\n} \
${DB_10_NAME:+${DB_10_NAME} = host=${DB_10_HOST} port=${DB_10_PORT:-5432} dbname=${DB_10_NAME} user=${DB_10_USER:-postgres} ${DB_10_PASSWORD:+password=${DB_10_PASSWORD}\n}}\

[pgbouncer]
# Generic settings
${LOGFILE:+logfile = ${LOGFILE}\n}\
${PIDFILE:+pidfile = ${PIDFILE}\n}\
listen_addr = ${LISTEN_ADDR:-0.0.0.0}
${LISTEN_PORT:+listen_port = ${LISTEN_PORT}\n}\
${UNIX_SOCKET_DIR:+unix_socket_dir = ${UNIX_SOCKET_DIR}\n}\
${UNIX_SOCKET_MODE:+unix_socket_mode = ${UNIX_SOCKET_MODE}\n}\
${UNIX_SOCKET_GROUP:+unix_socket_group = ${UNIX_SOCKET_GROUP}\n}\
${USER:+user = ${USER}\n}\
${AUTH_FILE:+auth_file = ${AUTH_FILE}\n}\
${AUTH_HBA_FILE:+auth_hba_file = ${AUTH_HBA_FILE}\n}\
auth_type = ${AUTH_TYPE:-any}
${AUTH_QUERY:+auth_query = ${AUTH_QUERY}\n}\
${POOL_MODE:+pool_mode = ${POOL_MODE}\n}\
${MAX_CLIENT_CONN:+max_client_conn = ${MAX_CLIENT_CONN}\n}\
${DEFAULT_POOL_SIZE:+default_pool_size = ${DEFAULT_POOL_SIZE}\n}\
${MIN_POOL_SIZE:+min_pool_size = ${MIN_POOL_SIZE}\n}\
${RESERVE_POOL_SIZE:+reserve_pool_size = ${RESERVE_POOL_SIZE}\n}\
${RESERVE_POOL_TIMEOUT:+reserve_pool_timeout = ${RESERVE_POOL_TIMEOUT}\n}\
${MAX_DB_CONNECTIONS:+max_db_connections = ${MAX_DB_CONNECTIONS}\n}\
${MAX_USER_CONNECTIONS:+max_user_connections = ${MAX_USER_CONNECTIONS}\n}\
${SERVER_ROUND_ROBIN:+server_round_robin = ${SERVER_ROUND_ROBIN}\n}\
ignore_startup_parameters = ${IGNORE_STARTUP_PARAMETERS:-extra_float_digits}
${DISABLE_PQEXEC:+disable_pqexec = ${DISABLE_PQEXEC}\n}\
${APPLICATION_NAME_ADD_HOST:+application_name_add_host = ${APPLICATION_NAME_ADD_HOST}\n}\
${CONFFILE:+conffile = ${CONFFILE}\n}\
${JOB_NAME:+job_name = ${JOB_NAME}\n}\

# Log settings
${SYSLOG:+syslog = ${SYSLOG}\n}\
${SYSLOG_IDENT:+syslog_ident = ${SYSLOG_IDENT}\n}\
${SYSLOG_FACILITY:+syslog_facility = ${SYSLOG_FACILITY}\n}\
${LOG_CONNECTIONS:+log_connections = ${LOG_CONNECTIONS}\n}\
${LOG_DISCONNECTIONS:+log_disconnections = ${LOG_DISCONNECTIONS}\n}\
${LOG_POOLER_ERRORS:+log_pooler_errors = ${LOG_POOLER_ERRORS}\n}\
${STATS_PERIOD:+stats_period = ${STATS_PERIOD}\n}\
${VERBOSE:+verbose = ${VERBOSE}\n}\
admin_users = ${ADMIN_USERS:-postgres}
${STATS_USERS:+stats_users = ${STATS_USERS}\n}\

# Connection sanity checks, timeouts
${SERVER_RESET_QUERY:+server_reset_query = ${SERVER_RESET_QUERY}\n}\
${SERVER_RESET_QUERY_ALWAYS:+server_reset_query_always = ${SERVER_RESET_QUERY_ALWAYS}\n}\
${SERVER_CHECK_DELAY:+server_check_delay = ${SERVER_CHECK_DELAY}\n}\
${SERVER_CHECK_QUERY:+server_check_query = ${SERVER_CHECK_QUERY}\n}\
${SERVER_LIFETIME:+server_lifetime = ${SERVER_LIFETIME}\n}\
${SERVER_IDLE_TIMEOUT:+server_idle_timeout = ${SERVER_IDLE_TIMEOUT}\n}\
${SERVER_CONNECT_TIMEOUT:+server_connect_timeout = ${SERVER_CONNECT_TIMEOUT}\n}\
${SERVER_LOGIN_RETRY:+server_login_retry = ${SERVER_LOGIN_RETRY}\n}\
${CLIENT_LOGIN_TIMEOUT:+client_login_timeout = ${CLIENT_LOGIN_TIMEOUT}\n}\
${AUTODB_IDLE_TIMEOUT:+autodb_idle_timeout = ${AUTODB_IDLE_TIMEOUT}\n}\
${DNS_MAX_TTL:+dns_max_ttl = ${DNS_MAX_TTL}\n}\
${DNS_NXDOMAIN_TTL:+dns_nxdomain_ttl = ${DNS_NXDOMAIN_TTL}\n}\

# TLS settings
${CLIENT_TLS_SSLMODE:+client_tls_sslmode = ${CLIENT_TLS_SSLMODE}\n}\
${CLIENT_TLS_KEY_FILE:+client_tls_key_file = ${CLIENT_TLS_KEY_FILE}\n}\
${CLIENT_TLS_CERT_FILE:+client_tls_cert_file = ${CLIENT_TLS_CERT_FILE}\n}\
${CLIENT_TLS_CA_FILE:+client_tls_ca_file = ${CLIENT_TLS_CA_FILE}\n}\
${CLIENT_TLS_PROTOCOLS:+client_tls_protocols = ${CLIENT_TLS_PROTOCOLS}\n}\
${CLIENT_TLS_CIPHERS:+client_tls_ciphers = ${CLIENT_TLS_CIPHERS}\n}\
${CLIENT_TLS_ECDHCURVE:+client_tls_ecdhcurve = ${CLIENT_TLS_ECDHCURVE}\n}\
${CLIENT_TLS_DHEPARAMS:+client_tls_dheparams = ${CLIENT_TLS_DHEPARAMS}\n}\
${SERVER_TLS_SSLMODE:+server_tls_sslmode = ${SERVER_TLS_SSLMODE}\n}\
${SERVER_TLS_CA_FILE:+server_tls_ca_file = ${SERVER_TLS_CA_FILE}\n}\
${SERVER_TLS_KEY_FILE:+server_tls_key_file = ${SERVER_TLS_KEY_FILE}\n}\
${SERVER_TLS_CERT_FILE:+server_tls_cert_file = ${SERVER_TLS_CERT_FILE}\n}\
${SERVER_TLS_PROTOCOLS:+server_tls_protocols = ${SERVER_TLS_PROTOCOLS}\n}\
${SERVER_TLS_CIPHERS:+server_tls_ciphers = ${SERVER_TLS_CIPHERS}\n}\

# Dangerous timeouts
${QUERY_TIMEOUT:+query_timeout = ${QUERY_TIMEOUT}\n}\
${QUERY_WAIT_TIMEOUT:+query_wait_timeout = ${QUERY_WAIT_TIMEOUT}\n}\
${CLIENT_IDLE_TIMEOUT:+client_idle_timeout = ${CLIENT_IDLE_TIMEOUT}\n}\
${IDLE_TRANSACTION_TIMEOUT:+idle_transaction_timeout = ${IDLE_TRANSACTION_TIMEOUT}\n}\
${PKT_BUF:+pkt_buf = ${PKT_BUF}\n}\
${MAX_PACKET_SIZE:+max_packet_size = ${MAX_PACKET_SIZE}\n}\
${LISTEN_BACKLOG:+listen_backlog = ${LISTEN_BACKLOG}\n}\
${SBUF_LOOPCNT:+sbuf_loopcnt = ${SBUF_LOOPCNT}\n}\
${SUSPEND_TIMEOUT:+suspend_timeout = ${SUSPEND_TIMEOUT}\n}\
${TCP_DEFER_ACCEPT:+tcp_defer_accept = ${TCP_DEFER_ACCEPT}\n}\
${TCP_KEEPALIVE:+tcp_keepalive = ${TCP_KEEPALIVE}\n}\
${TCP_KEEPCNT:+tcp_keepcnt = ${TCP_KEEPCNT}\n}\
${TCP_KEEPIDLE:+tcp_keepidle = ${TCP_KEEPIDLE}\n}\
${TCP_KEEPINTVL:+tcp_keepintvl = ${TCP_KEEPINTVL}\n}\
################## end file ##################
" > ${PG_CONFIG_DIR}/pgbouncer.ini
fi

adduser ${PG_USER}
mkdir -p ${PG_LOG}
chmod -R 755 ${PG_LOG}
chown -R ${PG_USER}:${PG_USER} ${PG_LOG}

if [ -z $QUIET ]; then
  cat ${PG_CONFIG_DIR}/pgbouncer.ini
fi
echo "Starting pgbouncer..."
exec /pgbouncer/bin/pgbouncer ${QUIET:+-q} -u ${PG_USER} ${PG_CONFIG_DIR}/pgbouncer.ini
