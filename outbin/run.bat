
 @echo on       //show command
 cd ..
 set APP_HOME=%cd%

 set JAVA_HOME=D:\work\jdk_x86\jdk1.7.0_40
 set CLASSPATH=.;%CLASSPATH%;%APP_HOME%\out\lib\commons-logging-1.1.1.jar; 
 set JAVA=%JAVA_HOME%\bin\java
 %JAVA% -jar %APP_HOME%\out\OpcConnect.jar   
 pause  //hold screen
 
