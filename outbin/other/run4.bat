@echo on 
rem ---------------------------------------------------------------------------
rem Start script for running the ZZNode Message Sender
rem
rem ---------------------------------------------------------------------------
set JAVA_HOME=D:\work\jdk_x86\jdk1.7.0_40

rem check the JAVA_HOME environment variable
if not "%JAVA_HOME%" == "" goto okJavaHome
echo The JAVA_HOME environment variable is not defined
echo This environment variable is needed to run this program
goto exit

:okJavaHome

rem store the current directory
set CURRENT_DIR=%cd%

rem check the RESOURCE_LOOKUP_HOME environment variable
if not "%INS_HOME%" == "" goto gotHome

rem guess the home.take the parent directory as the home
cd ..
set INS_HOME=%cd%

rem echo using Soap-Sender Home %INS_HOME%

:gotHome


:okHome

cd %INS_HOME%

rem add all command line parameters to the ARGS environment variable


setlocal EnableDelayedExpansion
rem loop through the libs and add them to the class path
set INS_CLASS_PATH=%INS_HOME%\outbin;
FOR %%c in (%INS_HOME%\out\lib\*.jar) DO set INS_CLASS_PATH=!INS_CLASS_PATH!;%%c
rem FOR %%c in (%INS_HOME%\lib\optional\*.jar) DO set INS_CLASS_PATH=!INS_CLASS_PATH!;%%c

echo %INS_CLASS_PATH%
echo %JAVA_HOME%
echo %INS_HOME%

"%JAVA_HOME%/bin/java" -Xms256m -Xmx1024m  -DPROCESS_ID=1 -cp %INS_CLASS_PATH% opctest.OpcConnect
endlocal
:exit
cd %CURRENT_DIR%
pause
