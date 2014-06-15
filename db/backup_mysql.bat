@echo off
REM ###########################################################  
REM # Windows Server 2003下Mysql数据库自动备份批处理脚本
REM ###########################################################  
REM 设置环境变量
set path=C:\Program Files\MySQL\MySQL Server 5.6\bin;%path%;
REM 取当前系统时间,可能因操作系统不同而取值不一样
set CURDATE=%date:~0,4%%date:~5,2%%date:~8,2%
set CURTIME=%time:~0,2%
REM 小时数如果小于10，则在前面补0
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
REM 设置用户名、密码和数据库
set USER=root
set PASSWORD=123456
set DATABASE=geodrilling_development
REM 创建备份用目录，目录结构为backup/YYYYMMDD/
if not exist "d:/backup"  mkdir "d:/backup"
if not exist "d:/backup/%CURDATE%/" mkdir "d:/backup/%CURDATE%/"
set CURDIR=d:/backup/%CURDATE%
set FILENAME=%CURDIR%/%CURDATE%_%CURTIME%_%DATABASE%.sql
REM 调用MYSQL的mysqldump命令导出用户数据
mysqldump -u%USER% -p%PASSWORD% %DATABASE% > %FILENAME%