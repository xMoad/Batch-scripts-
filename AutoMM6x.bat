:: Author: Mouad ZAID
:: CC\EYB5
:: Automate comment filling in the measurement files 
:: to guarantee a tracability of the files 

:Variables
SET fileMeasurementPath=C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC

echo.
echo Modify the comment section of the zip file 
PAUSE

FOR /F "delims=|" %%I IN ('DIR "%fileMeasurementPath%\*.zip" /B /O:D') DO SET NewestFile=%%I
copy "%fileMeasurementPath%\%NewestFile%" "%fileMeasurementPath%\temp\%NewestFile%"
PAUSE
ECHO %NewestFile%
Set FileName7z=%NewestFile%


if not exist "%fileMeasurementPath%\temp\%NewestFile%\_extract" mkdir %fileMeasurementPath%\temp\_extract
PAUSE

7z x %fileMeasurementPath%\temp\%NewestFile% -Y -o%fileMeasurementPath%\temp\_extract
PAUSE

cd %fileMeasurementPath%\temp\_extract
PAUSE



SET CSVfilename=C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC\temp\_extract\tables\internals.csv
CD C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC\temp\_extract\tables\


for /f "tokens=*" %%i in ('FINDSTR /C:"Node" %CSVfilename%') do set var1=%%i  
echo %var1:~5,10%
SET var1=%var1:~5,10%
PAUSE

for /f "tokens=*" %%j in ('FINDSTR /C:"Device" %CSVfilename%') do set var2=%%j 
echo %var2:~15,16%
SET var2=%var2:~15,16%
PAUSE

for /f "tokens=*" %%k in ('FINDSTR /C:"TFW_Version" %CSVfilename%') do set var3=%%k
echo %var3:~12,14%
SET var3=%var3:~12,14%
PAUSE

for /f "tokens=*" %%m in ('FINDSTR /C:"FileName" %CSVfilename%') do set var5=%%m
echo %var5:~12,15%
SET var5=%var5:~12,15%
PAUSE

for /f "tokens=*" %%n in ('FINDSTR /C:"ProjectFolder" %CSVfilename%') do set var6=%%n
echo %var6:~14,57%
SET var6=%var6:~14,57%
PAUSE

for /f "tokens=*" %%n in ('FINDSTR /C:"ImcCom_Version" %CSVfilename%') do set var7=%%n
echo %var7:~15,12%
SET var7=%var7:~15,12%
PAUSE

set datetime=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%

(
echo Release Date : %datetime% 
echo File Name : %NewestFile%
echo User: %USERNAME%
echo PC Name: %var1%
echo IMCDev Version: %var2%
echo IMCCom Version: %var7%
echo TFW Version: %var3%
echo Project Path: %var6%
echo .
echo __________________ADDITIONAL_COMMENT___ROBERT_BOSCH_GMBH______________________
echo    NAME        : PSA 
echo    CAR         : PSA EMP2V4
echo    NUMBER      : CTP#02    
echo    BRAKES      : Hitachi Brakes Ø48 360x26, MoC Left n°22024200005304 and MoC Right MoC n°22024200004904
echo    TESTENGINEER: %USERNAME%
echo    PLACE       : Dy / EYB5
echo    SYSTEM      : ESP9.3 HP / APB-Mi B-sample
echo    ECU         : 99 00012 / 0273B71795
echo    SOFTWARE    : ApplContainer_V0200_BB81940_CSWxBxD5EDxEMP2V4xHP.appl.zip / HP Janv 2021
echo    HU          : 0 265 B49 554-03 / CC-222674
echo    SENSORS     : ACEK07, ACEK09, ACPE080, ACPE075, ACPE070, ACPE056, ADIL20, ADIL26, ADIL40
echo ______________________________________________________________________________________
)> C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC\temp\_extract\output.txt

FOR /F "delims=|" %%I IN ('DIR "%fileMeasurementPath%\temp\_extract\*.D97" /B /O:D') DO SET NewestFile=%%I
copy "C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC\temp\_extract" "C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC\temp\_extract\Archive"
PAUSE

FOR /F "delims=|" %%I IN ('DIR "%fileMeasurementPath%\temp\_extract\*.TXT" /B /O:D') DO SET NewestFile=%%I
copy "C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC\temp\_extract" "C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC\temp\_extract\Archive"
PAUSE

FOR /F "delims=|" %%I IN ('DIR "%fileMeasurementPath%\temp\_extract\*.PLT" /B /O:D') DO SET NewestFile=%%I
copy "C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC\temp\_extract" "C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC\temp\_extract\Archive"
PAUSE

7z a "C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC\temp\_extract\Archive\%FileName7z%" "C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC\temp\_extract\Archive\*"

Rem // To Do List 
Rem // Copy the file to the appropriate destination 
Rem // Delete all temp files 






















