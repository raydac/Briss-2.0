set "BRISS_HOME=%cd%"
set "LOG_FILE=%BRISS_HOME%\console.log"

rem uncomment the line below if graphics works slowly
rem set JAVA_EXTRA_GFX_FLAGS="-Dsun.java2d.opengl=true"
rem set JAVA_EXTRA_GFX_FLAGS="-Dcom.sun.management.jmxremote=true -Dsun.java2d.opengl=true"

set JAVA_FLAGS="-XX:+IgnoreUnrecognizedVMOptions --add-opens=java.base/java.lang=ALL-UNNAMED -Dsun.java2d.dpiaware=true -Dswing.aatext=true -Dawt.useSystemAAFontSettings=on"
set JAVA_RUN="java.exe"

echo %%JAVA_RUN%%=%JAVA_RUN% > %LOG_FILE%

echo ------JAVA_VERSION------ >> %LOG_FILE%

%JAVA_RUN% -version 2>> %LOG_FILE%

echo ------------------------ >> %LOG_FILE%

"%BRIS_HOME%\jre\bin\%JAVA_RUN% %JAVA_FLAGS% %JAVA_EXTRA_GFX_FLAGS%" -jar "%BRISS_HOME%\briss-2.0.jar" %* 2>> %LOG_FILE%
