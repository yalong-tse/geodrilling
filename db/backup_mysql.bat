@echo off
REM ###########################################################  
REM # Windows Server 2003��Mysql���ݿ��Զ�����������ű�
REM ###########################################################  
REM ���û�������
set path=C:\Program Files\MySQL\MySQL Server 5.6\bin;%path%;
REM ȡ��ǰϵͳʱ��,���������ϵͳ��ͬ��ȡֵ��һ��
set CURDATE=%date:~0,4%%date:~5,2%%date:~8,2%
set CURTIME=%time:~0,2%
REM Сʱ�����С��10������ǰ�油0
if "%CURTIME%"==" 0" set CURTIME=00
if "%CURTIME%"==" 1" set CURTIME=01
if "%CURTIME%"==" 2" set CURTIME=02
if "%CURTIME%"==" 3" set CURTIME=03
if "%CURTIME%"==" 4" set CURTIME=04
if "%CURTIME%"==" 5" set CURTIME=05
if "%CURTIME%"==" 6" set CURTIME=06
if "%CURTIME%"==" 7" set CURTIME=07
if "%CURTIME%"==" 8" set CURTIME=08
if "%CURTIME%"==" 9" set CURTIME=09
set CURTIME=%CURTIME%%time:~3,2%%time:~6,2%
REM �����û�������������ݿ�
set USER=root
set PASSWORD=123456
set DATABASE=geodrilling_development
REM ����������Ŀ¼��Ŀ¼�ṹΪbackup/YYYYMMDD/
if not exist "d:/backup"  mkdir "d:/backup"
if not exist "d:/backup/%CURDATE%/" mkdir "d:/backup/%CURDATE%/"
set CURDIR=d:/backup/%CURDATE%
set FILENAME=%CURDIR%/%CURDATE%_%CURTIME%_%DATABASE%.sql
REM ����MYSQL��mysqldump������û�����
mysqldump -u%USER% -p%PASSWORD% %DATABASE% > %FILENAME%