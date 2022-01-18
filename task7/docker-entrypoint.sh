#!/bin/sh
#
LMS_INI_FILE=/etc/lms/lms.ini
LMS_INI_SAMPLE_FILE=/usr/share/lms/sample/lms.ini
if [ -f "$LMS_INI_FILE" ]
then
    echo "$LMS_INI_FILE found. Starting Apache"
    apachectl -D FOREGROUND "$@"
else
    echo "$LMS_INI_FILE not found. Copy sample lms.ini"
    sed -i -e 's/; type               = mysql/type = {SQL_TYPE}/' $LMS_INI_SAMPLE_FILE
    sed -i -e 's/; host               = localhost/host = ${MYSQL_HOST}/' $LMS_INI_SAMPLE_FILE
    sed -i -e 's/; user               = mysql/user = ${MYSQL_USER}/' $LMS_INI_SAMPLE_FILE
    sed -i -e 's/; password          = /password = ${MYSQL_PASS}/' $LMS_INI_SAMPLE_FILE
    sed -i -e 's/; database          = lms/database = ${MYSQL_DATABASE}/' $LMS_INI_SAMPLE_FILE
    mkdir -p /etc/lms
    envsubst < ${LMS_INI_SAMPLE_FILE} >> ${LMS_INI_FILE}
fi
exec "$@"