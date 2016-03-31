
#!/bin/bash

if [ -d "/usr/lib/bigtop-tomcat" ]; then
  export OOZIE_CONFIG=${OOZIE_CONFIG:-/etc/oozie/conf}
  export CATALINA_BASE=${CATALINA_BASE:-/usr/hdp/current/oozie-client/oozie-server}
  export CATALINA_TMPDIR=${CATALINA_TMPDIR:-/var/tmp/oozie}
  export OOZIE_CATALINA_HOME=/usr/lib/bigtop-tomcat
fi

#Set JAVA HOME
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk.x86_64

export JRE_HOME=${JAVA_HOME}

# Set Oozie specific environment variables here.

# Settings for the Embedded Tomcat that runs Oozie
# Java System properties for Oozie should be specified in this variable
#
# export CATALINA_OPTS=

# Oozie configuration file to load from Oozie configuration directory
#
# export OOZIE_CONFIG_FILE=oozie-site.xml

# Oozie logs directory
#
export OOZIE_LOG=/var/log/oozie

# Oozie pid directory
#
export CATALINA_PID=/var/run/oozie/oozie.pid

#Location of the data for oozie
export OOZIE_DATA=/hadoop/oozie/data

# Oozie Log4J configuration file to load from Oozie configuration directory
#
# export OOZIE_LOG4J_FILE=oozie-log4j.properties

# Reload interval of the Log4J configuration file, in seconds
#
# export OOZIE_LOG4J_RELOAD=10

# The port Oozie server runs
#
export OOZIE_HTTP_PORT=11000

# The admin port Oozie server runs
#
export OOZIE_ADMIN_PORT=11001

# The host name Oozie server runs on
#
# export OOZIE_HTTP_HOSTNAME=`hostname -f`

# The base URL for callback URLs to Oozie
#
# export OOZIE_BASE_URL="http://${OOZIE_HTTP_HOSTNAME}:${OOZIE_HTTP_PORT}/oozie"
export JAVA_LIBRARY_PATH=/usr/hdp/current/hadoop-client/lib/native/Linux-amd64-64

# At least 1 minute of retry time to account for server downtime during
# upgrade/downgrade
export OOZIE_CLIENT_OPTS="${OOZIE_CLIENT_OPTS} -Doozie.connection.retry.count=5 "

# This is needed so that Oozie does not run into OOM or GC Overhead limit
# exceeded exceptions. If the oozie server is handling large number of
# workflows/coordinator jobs, the memory settings may need to be revised
export CATALINA_OPTS="${CATALINA_OPTS} -Xmx2048m -XX:MaxPermSize=256m "
    
