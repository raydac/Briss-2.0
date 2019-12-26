#!/bin/bash

BRISS_HOME="$(dirname ${BASH_SOURCE[0]})"
LOG_FILE=$BRISS_HOME/console.log
JAVA_HOME=$BRISS_HOME/jre

#JAVA_EXTRA_GFX_FLAGS="-Dcom.sun.management.jmxremote=true -Dsun.java2d.opengl=true"
#JAVA_EXTRA_GFX_FLAGS="-Dsun.java2d.opengl=true"

JAVA_FLAGS="-XX:+IgnoreUnrecognizedVMOptions --add-opens=java.base/java.util=ALL-UNNAMED -Dsun.java2d.dpiaware=true -Dswing.aatext=false -Dawt.useSystemAAFontSettings=off"

JAVA_RUN=$JAVA_HOME/bin/java

if [ -f $BRISS_HOME/.pid ];
then
    SAVED_PID=$(cat $BRISS_HOME/.pid)
    if [ -f /proc/$SAVED_PID/exe ];
    then
        echo Application already started! if it is wrong, just delete the .pid file in the editor folder root!
        exit 1
    fi
fi

echo \$JAVA_RUN=$JAVA_RUN &>$LOG_FILE

echo ------JAVA_VERSION------ &>>$LOG_FILE

$JAVA_RUN -version &>>$LOG_FILE

echo ------------------------ &>>$LOG_FILE

$JAVA_RUN $JAVA_FLAGS $JAVA_EXTRA_GFX_FLAGS -jar $BRISS_HOME/briss2.0.jar $@ &>>$LOG_FILE&
THE_PID=$!
echo $THE_PID>$BRISS_HOME/.pid
wait $THE_PID
rm $BRISS_HOME/.pid
exit 0
