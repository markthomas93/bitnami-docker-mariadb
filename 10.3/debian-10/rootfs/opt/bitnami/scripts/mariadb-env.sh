#!/bin/bash
#
# Environment configuration for mariadb

# The values for all environment variables will be set in the below order of precedence
# 1. Custom environment variables defined below after Bitnami defaults
# 2. Constants defined in this file (environment variables with no default), i.e. BITNAMI_ROOT_DIR
# 3. Environment variables overridden via external files using *_FILE variables (see below)
# 4. Environment variables set externally (i.e. current Bash context/Dockerfile/userdata)

export BITNAMI_ROOT_DIR="/opt/bitnami"
export BITNAMI_VOLUME_DIR="/bitnami"

# Logging configuration
export MODULE="${MODULE:-mariadb}"
export BITNAMI_DEBUG="${BITNAMI_DEBUG:-false}"

# By setting an environment variable matching *_FILE to a file path, the prefixed environment
# variable will be overridden with the value specified in that file
mariadb_env_vars=(
    ALLOW_EMPTY_PASSWORD
    MARIADB_AUTHENTICATION_PLUGIN
    MARIADB_ROOT_USER
    MARIADB_ROOT_PASSWORD
    MARIADB_USER
    MARIADB_PASSWORD
    MARIADB_DATABASE
    MARIADB_MASTER_HOST
    MARIADB_MASTER_PORT_NUMBER
    MARIADB_MASTER_ROOT_USER
    MARIADB_MASTER_ROOT_PASSWORD
    MARIADB_REPLICATION_USER
    MARIADB_REPLICATION_PASSWORD
    MARIADB_PORT_NUMBER
    MARIADB_REPLICATION_MODE
    MARIADB_EXTRA_FLAGS
    MARIADB_INIT_SLEEP_TIME
    MARIADB_CHARACTER_SET
    MARIADB_COLLATE
    MARIADB_BIND_ADDRESS
    MARIADB_SQL_MODE

)
for env_var in "${mariadb_env_vars[@]}"; do
    file_env_var="${env_var}_FILE"
    if [[ -n "${!file_env_var:-}" ]]; then
        export "${env_var}=$(< "${!file_env_var}")"
        unset "${file_env_var}"
    fi
done
unset mariadb_env_vars
export DB_FLAVOR="mariadb"

# Paths
export DB_BASE_DIR="${BITNAMI_ROOT_DIR}/mariadb"
export DB_VOLUME_DIR="${BITNAMI_VOLUME_DIR}/mariadb"
export DB_DATA_DIR="${DB_VOLUME_DIR}/data"
export DB_BIN_DIR="${DB_BASE_DIR}/bin"
export DB_SBIN_DIR="${DB_BASE_DIR}/sbin"
export DB_CONF_DIR="${DB_BASE_DIR}/conf"
export DB_LOGS_DIR="${DB_BASE_DIR}/logs"
export DB_TMP_DIR="${DB_BASE_DIR}/tmp"
export DB_CONF_FILE="${DB_CONF_DIR}/my.cnf"
export DB_PID_FILE="${DB_TMP_DIR}/mysqld.pid"
export DB_SOCKET_FILE="${DB_TMP_DIR}/mysql.sock"
export PATH="${DB_SBIN_DIR}:${DB_BIN_DIR}:/opt/bitnami/common/bin:${PATH}"

# System users (when running with a privileged user)
export DB_DAEMON_USER="mysql"
export DB_DAEMON_GROUP="mysql"

# Default configuration (build-time)
export MARIADB_DEFAULT_PORT_NUMBER="3306" # only used at build time
export DB_DEFAULT_PORT_NUMBER="$MARIADB_DEFAULT_PORT_NUMBER"
export MARIADB_DEFAULT_CHARACTER_SET="utf8" # only used at build time
export DB_DEFAULT_CHARACTER_SET="$MARIADB_DEFAULT_CHARACTER_SET"
export MARIADB_DEFAULT_COLLATE="utf8_general_ci" # only used at build time
export DB_DEFAULT_COLLATE="$MARIADB_DEFAULT_COLLATE"
export MARIADB_DEFAULT_BIND_ADDRESS="0.0.0.0" # only used at build time
export DB_DEFAULT_BIND_ADDRESS="$MARIADB_DEFAULT_BIND_ADDRESS"

# MariaDB authentication.
export ALLOW_EMPTY_PASSWORD="${ALLOW_EMPTY_PASSWORD:-no}"
export MARIADB_AUTHENTICATION_PLUGIN="${MARIADB_AUTHENTICATION_PLUGIN:-}"
export DB_AUTHENTICATION_PLUGIN="$MARIADB_AUTHENTICATION_PLUGIN"
export MARIADB_ROOT_USER="${MARIADB_ROOT_USER:-root}" # only used during the first initialization
export DB_ROOT_USER="$MARIADB_ROOT_USER"
export MARIADB_ROOT_PASSWORD="${MARIADB_ROOT_PASSWORD:-}" # only used during the first initialization
export DB_ROOT_PASSWORD="$MARIADB_ROOT_PASSWORD"
export MARIADB_USER="${MARIADB_USER:-}" # only used during the first initialization
export DB_USER="$MARIADB_USER"
export MARIADB_PASSWORD="${MARIADB_PASSWORD:-}" # only used during the first initialization
export DB_PASSWORD="$MARIADB_PASSWORD"
export MARIADB_DATABASE="${MARIADB_DATABASE:-}" # only used during the first initialization
export DB_DATABASE="$MARIADB_DATABASE"
export MARIADB_MASTER_HOST="${MARIADB_MASTER_HOST:-}" # only used during the first initialization
export DB_MASTER_HOST="$MARIADB_MASTER_HOST"
export MARIADB_MASTER_PORT_NUMBER="${MARIADB_MASTER_PORT_NUMBER:-3306}" # only used during the first initialization
export DB_MASTER_PORT_NUMBER="$MARIADB_MASTER_PORT_NUMBER"
export MARIADB_MASTER_ROOT_USER="${MARIADB_MASTER_ROOT_USER:-root}" # only used during the first initialization
export DB_MASTER_ROOT_USER="$MARIADB_MASTER_ROOT_USER"
export MARIADB_MASTER_ROOT_PASSWORD="${MARIADB_MASTER_ROOT_PASSWORD:-}" # only used during the first initialization
export DB_MASTER_ROOT_PASSWORD="$MARIADB_MASTER_ROOT_PASSWORD"
export MARIADB_REPLICATION_USER="${MARIADB_REPLICATION_USER:-}" # only used during the first initialization
export DB_REPLICATION_USER="$MARIADB_REPLICATION_USER"
export MARIADB_REPLICATION_PASSWORD="${MARIADB_REPLICATION_PASSWORD:-}" # only used during the first initialization
export DB_REPLICATION_PASSWORD="$MARIADB_REPLICATION_PASSWORD"

# Settings
export MARIADB_PORT_NUMBER="${MARIADB_PORT_NUMBER:-}"
export DB_PORT_NUMBER="$MARIADB_PORT_NUMBER"
export MARIADB_REPLICATION_MODE="${MARIADB_REPLICATION_MODE:-}"
export DB_REPLICATION_MODE="$MARIADB_REPLICATION_MODE"
export MARIADB_EXTRA_FLAGS="${MARIADB_EXTRA_FLAGS:-}"
export DB_EXTRA_FLAGS="$MARIADB_EXTRA_FLAGS"
export MARIADB_INIT_SLEEP_TIME="${MARIADB_INIT_SLEEP_TIME:-}"
export DB_INIT_SLEEP_TIME="$MARIADB_INIT_SLEEP_TIME"
export MARIADB_CHARACTER_SET="${MARIADB_CHARACTER_SET:-}"
export DB_CHARACTER_SET="$MARIADB_CHARACTER_SET"
# MARIADB_COLLATION is deprecated in favor of MARIADB_COLLATE
MARIADB_COLLATE="${MARIADB_COLLATE:-"${MARIADB_COLLATION:-}"}"
export MARIADB_COLLATE="${MARIADB_COLLATE:-}"
export DB_COLLATE="$MARIADB_COLLATE"
export MARIADB_BIND_ADDRESS="${MARIADB_BIND_ADDRESS:-}"
export DB_BIND_ADDRESS="$MARIADB_BIND_ADDRESS"
export MARIADB_SQL_MODE="${MARIADB_SQL_MODE:-}"
export DB_SQL_MODE="$MARIADB_SQL_MODE"

# Custom environment variables may be defined below
