#!/usr/bin/env bash

SERVER_ADDR=${SERVER_ADDR}
SERVER_PORT=${SERVER_PORT}

LOCAL_PORT=${LOCAL_PORT}
LOCAL_IP=${LOCAL_IP}
USER=${USER}
USE_ENCRYPTION=${USE_ENCRYPTION}
USE_COMPRESSION=${USE_COMPRESSION}

CUSTOM_DOMAINS=${CUSTOM_DOMAINS}

FRPC_INI_FILEPATH=${HOME}/frpc.ini

# Build frpc.ini
echo "[common]" >> ${FRPC_INI_FILEPATH}
echo "server_addr = ${SERVER_ADDR}" >> ${FRPC_INI_FILEPATH}
echo "server_port = ${SERVER_PORT}" >> ${FRPC_INI_FILEPATH}

if [ -v "TOKEN" ]; then
echo "token = ${TOKEN}" >> ${FRPC_INI_FILEPATH}
fi

echo "user = ${USER}" >> ${FRPC_INI_FILEPATH}
echo "login_fail_exit = false" >> ${FRPC_INI_FILEPATH}  # Keep trying to log in to frps
echo "" >> ${FRPC_INI_FILEPATH}

echo "[web]" >> ${FRPC_INI_FILEPATH}
echo "type = http" >> ${FRPC_INI_FILEPATH}
echo "local_port = ${LOCAL_PORT}" >> ${FRPC_INI_FILEPATH}
echo "local_ip = ${LOCAL_IP}" >> ${FRPC_INI_FILEPATH}
echo "use_encryption = ${USE_ENCRYPTION}" >> ${FRPC_INI_FILEPATH}
echo "use_compression = ${USE_COMPRESSION}" >> ${FRPC_INI_FILEPATH}

if [ -v "HTTP_USER" ] && [ -v "HTTP_PWD" ]; then
echo "http_user = ${HTTP_USER}" >> ${FRPC_INI_FILEPATH}
echo "http_pwd = ${HTTP_PWD}" >> ${FRPC_INI_FILEPATH}
fi

echo "custom_domains = ${CUSTOM_DOMAINS}" >> ${FRPC_INI_FILEPATH}

/frpc -c ${FRPC_INI_FILEPATH}
