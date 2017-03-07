@echo on
set JAVA_HOME=D:\work\jdk_x86\jdk1.7.0_40
set classpath=.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;D:\work\eclipse\workspace-jee\tech30Opc\out\lib\commons-logging-1.1.1.jar; 
set path=%JAVA_HOME%\bin
java D:\work\eclipse\workspace-jee\tech30Opc\out opctest.OpcConnect
pause

