@ECHO OFF
ECHO %~nx0
ECHO ----------------------------------------------------------------------
SET Fallout=%~1
SET DataFile=%~2
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
REM  ----------------------------------------------------------------------
SET "Archive=%Meta%\Archive.%ArchiveType%"
SET "ArchiveList=%Archive%.txt"
ECHO Reading the file list to use...
ECHO Reading::%ArchiveList%
TYPE "%ArchiveList%"
ECHO.
ECHO.
FOR /F "usebackq tokens=*" %%A in ("%ArchiveList%") do (
	ECHO From: %Fallout%\Data\%%A
	ECHO To: %Archive%\%%A
	ECHO F|XCOPY /Q /Y "%Fallout%\Data\%%A" "%Archive%\%%A"
	ECHO.
)
TREE "%Archive%" /F
ECHO ----------------------------------------------------------------------
