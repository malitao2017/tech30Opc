
@echo on //off
cd ..
set APP_HOME=%cd%
set JAVA_HOME=D:\work\jdk_x86\jdk1.7.0_40
cd outbin
start "" "%JAVA_HOME%\bin\javaw.exe" -classpath "%APP_HOME%\out\OpcConnect.jar" -Djava.ext.dirs="%JAVA_HOME%\jre\lib\ext";"%APP_HOME%\out\lib" -Xms256m -Xmx512m opctest.OpcConnect
pause


