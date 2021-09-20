:Variables
SET fileMeasurementPath=C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC

echo.
echo Modify the comment section of the zip file 
PAUSE

FOR /F "delims=|" %%I IN ('DIR "%fileMeasurementPath%\*.zip" /B /O:D') DO SET NewestFile=%%I
copy "%fileMeasurementPath%\%NewestFile%" "%fileMeasurementPath%\temp\%NewestFile%"
PAUSE
ECHO %NewestFile%


CD C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC\temp\_extract\

powershell -Command "Get-ChildItem | Out-File C:\mt\EM\LDM\GolfGTE_ECU_WO_XPC\temp\_extract\out.txt"


