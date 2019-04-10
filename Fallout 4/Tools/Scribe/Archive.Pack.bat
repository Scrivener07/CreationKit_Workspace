@ECHO OFF
ECHO %~nx0
ECHO ----------------------------------------------------------------------
SET Fallout=%~1
SET DataFile=%~2
SET DataFileName=%~n2
SET ArchiveType=%~3
REM
ECHO The data file to use.
ECHO DataFile: %DataFile%
ECHO.
REM  ----------------------------------------------------------------------
ECHO The data file meta directory to use.
SET "Meta=%Fallout%\Data\.%DataFile%"
ECHO Meta: %Meta%
ECHO.
ECHO The BSArch executable file path to use.
SET "BSArch=%Fallout%\Tools\BSArch\BSArch.exe"
ECHO BSArch: %BSArch%
ECHO.
REM  ----------------------------------------------------------------------
ECHO The archive's imports and exports to use.
SET "ArchiveImport=%Meta%\Archive.%ArchiveType%"
SET "ArchiveExport=%Fallout%\Data\%DataFileName% - %ArchiveType%.ba2"
ECHO ArchiveImport: %ArchiveImport%
ECHO ArchiveExport: %ArchiveExport%
TREE "%ArchiveImport%" /F
IF "%ArchiveType%"=="Main" (
	CALL "%BSArch%" pack "%ArchiveImport%" "%ArchiveExport%" -fo4
)
IF "%ArchiveType%"=="Textures" (
	CALL "%BSArch%" pack "%ArchiveImport%" "%ArchiveExport%" -fo4dds
)
ECHO ----------------------------------------------------------------------
