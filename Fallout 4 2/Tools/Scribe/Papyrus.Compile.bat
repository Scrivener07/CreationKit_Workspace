@ECHO OFF
ECHO %~nx0
ECHO ----------------------------------------------------------------------
SET Fallout=%~1
SET DataFile=%~2
REM
ECHO The data file to use.
ECHO DataFile: %DataFile%
ECHO.
REM  ----------------------------------------------------------------------
ECHO The data file meta directory to use.
SET "Meta=%Fallout%\Data\.%DataFile%"
ECHO Meta: %Meta%
ECHO.
ECHO The Papyrus Compiler executable to use.
SET "PapyrusCompiler=%Fallout%\Papyrus Compiler\PapyrusCompiler.exe"
ECHO PapyrusCompiler: %PapyrusCompiler%
ECHO.
REM  ----------------------------------------------------------------------
SET "ProjectList=%Meta%\Papyrus.Compile.txt"
ECHO Reading the file list to use...
ECHO Reading::%ProjectList%
TYPE "%ProjectList%"
ECHO.
ECHO.
FOR /F "usebackq tokens=*" %%A in ("%ProjectList%") do (
	ECHO Project: %Fallout%\Data\%%A
	CALL "%PapyrusCompiler%" "%Fallout%\Data\%%A"
	ECHO.
)
ECHO.
ECHO ----------------------------------------------------------------------
