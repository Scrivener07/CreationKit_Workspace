@ECHO OFF
ECHO %~nx0
ECHO ----------------------------------------------------------------------
SET Fallout=%~1
SET Flash=%~2
SET DataFile=%~3
REM
ECHO The Adobe Flash executable to use.
ECHO Flash: %Flash%
ECHO.
ECHO The data file to use.
ECHO DataFile: %DataFile%
ECHO.
REM  ----------------------------------------------------------------------
ECHO The data file meta directory to use.
SET "Meta=%Fallout%\Data\.%DataFile%"
ECHO Meta: %Meta%
ECHO.
ECHO The JSFL flash compiler file path to use.
SET "Compiler=%Fallout%\Tools\Flash Compiler\Compiler.jsfl"
ECHO Compiler: %Compiler%
ECHO.
REM  ----------------------------------------------------------------------
SET "ProjectList=%Meta%\Flash.Publish.txt"
SET "ProjectLog=%Meta%\Flash.Publish.log.txt"
ECHO Reading the flash publish list to use...
ECHO Reading::%ProjectList%
TYPE "%ProjectList%"
ECHO.
ECHO.
PAUSE
ECHO Follow the prompts in the Flash IDE once it launches to select a build list text file.
CALL "%Flash%" "%Compiler%"
TYPE "%ProjectLog%"
ECHO.
ECHO ----------------------------------------------------------------------
