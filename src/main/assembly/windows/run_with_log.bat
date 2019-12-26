set "BRISS_HOME=%cd%"
set "LOG_FILE=%BRISS_HOME%\console.log"

set JAVA_FLAGS="--add-opens=java.base/java.lang=ALL-UNNAMED"
set JAVA_RUN=java.exe

set JAVA_EXE_PATH="%BRISS_HOME%\jre\bin\%JAVA_RUN%"

echo %%JAVA_RUN%%=%JAVA_EXE_PATH% > %LOG_FILE%

echo ------JAVA_VERSION------ >> %LOG_FILE%

%JAVA_EXE_PATH% -version 2>> %LOG_FILE%

echo ------------------------ >> %LOG_FILE%
%JAVA_EXE_PATH% %JAVA_FLAGS% %JAVA_EXTRA_GFX_FLAGS% -jar "%BRISS_HOME%\briss-2.0.jar" %* 2>> %LOG_FILE%
