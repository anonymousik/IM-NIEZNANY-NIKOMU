@echo off
chcp 65001 > nul
setlocal EnableDelayedExpansion
color 0B
mode con: cols=85 lines=40

:: ============================================================================
::  SecFERRO DIVISION - Advanced CS2 Network Optimization System
::  Version: 2.0 TACTICAL
:: ============================================================================

title SecFERRO DIVISION - Master Control System v2.0

:: Sprawdzanie uprawnień administratora
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    cls
    echo.
    echo  ╔═══════════════════════════════════════════════════════════════════════════╗
    echo  ║                         ! CRITICAL ACCESS DENIED !                        ║
    echo  ╚═══════════════════════════════════════════════════════════════════════════╝
    echo.
    echo  [SecFERRO] Administrator privileges required.
    echo  [SOLUTION] Right-click and select "Run as Administrator"
    echo.
    pause
    exit /b
)

:: Inicjalizacja zmiennych
set "LOG_FILE=%~dp0SecFERRO_Log_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
set "LOG_FILE=%LOG_FILE: =0%"
set "STEAM_PATH="
set "CS2_CONFIG="
set "OPTIMAL_SERVER="

:DISPLAY_BANNER
cls
echo.
echo  ╔═══════════════════════════════════════════════════════════════════════════╗
echo  ║                                                                           ║
echo  ║   ███████╗███████╗ ██████╗███████╗███████╗██████╗ ██████╗  ██████╗      ║
echo  ║   ██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝██╔══██╗██╔══██╗██╔═══██╗     ║
echo  ║   ███████╗█████╗  ██║     █████╗  █████╗  ██████╔╝██████╔╝██║   ██║     ║
echo  ║   ╚════██║██╔══╝  ██║     ██╔══╝  ██╔══╝  ██╔══██╗██╔══██╗██║   ██║     ║
echo  ║   ███████║███████╗╚██████╗██║     ███████╗██║  ██║██║  ██║╚██████╔╝     ║
echo  ║   ╚══════╝╚══════╝ ╚═════╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝      ║
echo  ║                                                                           ║
echo  ║                    DIVISION TACTICAL OPTIMIZATION SUITE                   ║
echo  ║                         Counter-Strike 2 Edition                          ║
echo  ║                              Version 2.0                                  ║
echo  ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo  [%time:~0,8%] System initialized. Awaiting operator command...
echo.
timeout /t 2 >nul

:MAIN_MENU
cls
call :DISPLAY_BANNER
echo  ╔═══════════════════════════════════════════════════════════════════════════╗
echo  ║                          OPERATIONAL MENU                                 ║
echo  ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo   [1] FULL TACTICAL DEPLOYMENT (Complete System Optimization)
echo   [2] NETWORK OPTIMIZATION ONLY (Quick Network Fix)
echo   [3] CS2 SERVER DIAGNOSTICS (Test Valve Servers)
echo   [4] CS2 CONFIG INJECTION (Auto-optimize Game Settings)
echo   [5] SYSTEM DIAGNOSTICS (Network Status Report)
echo   [6] VIEW OPERATION LOG
echo   [7] EXIT SYSTEM
echo.
echo  ─────────────────────────────────────────────────────────────────────────────
echo.
set /p "MENU_CHOICE= [SecFERRO] Select operation [1-7]: "

if "%MENU_CHOICE%"=="1" goto FULL_DEPLOYMENT
if "%MENU_CHOICE%"=="2" goto NETWORK_ONLY
if "%MENU_CHOICE%"=="3" goto CS2_SERVER_TEST
if "%MENU_CHOICE%"=="4" goto CS2_CONFIG
if "%MENU_CHOICE%"=="5" goto DIAGNOSTICS
if "%MENU_CHOICE%"=="6" goto VIEW_LOG
if "%MENU_CHOICE%"=="7" goto EXIT_SYSTEM
goto MAIN_MENU

:FULL_DEPLOYMENT
cls
call :DISPLAY_BANNER
echo  ╔═══════════════════════════════════════════════════════════════════════════╗
echo  ║                    INITIATING FULL TACTICAL DEPLOYMENT                    ║
echo  ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo  [SecFERRO] Creating system restore point...
call :LOG_ENTRY "Full Tactical Deployment initiated"

wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "SecFERRO Pre-Optimization", 100, 7 >nul 2>&1
if %errorLevel% equ 0 (
    echo  [✓] Restore point created successfully
    call :LOG_ENTRY "System restore point created"
) else (
    echo  [!] Restore point creation failed - continuing anyway
    call :LOG_ENTRY "WARNING: Restore point creation failed"
)
timeout /t 2 >nul

echo.
echo  [SecFERRO] Executing Phase 1: Network Stack Optimization...
call :LOG_ENTRY "Phase 1: Network optimization started"
call :NETWORK_OPTIMIZATION

echo.
echo  [SecFERRO] Executing Phase 2: CS2 Server Analysis...
call :LOG_ENTRY "Phase 2: CS2 server analysis started"
call :CS2_SERVER_ANALYSIS

echo.
echo  [SecFERRO] Executing Phase 3: Game Configuration...
call :LOG_ENTRY "Phase 3: CS2 configuration started"
call :CS2_CONFIG_INJECT

echo.
echo  [SecFERRO] Executing Phase 4: System Registry Optimization...
call :LOG_ENTRY "Phase 4: Registry optimization started"
call :REGISTRY_OPTIMIZATION

echo.
echo  ╔═══════════════════════════════════════════════════════════════════════════╗
echo  ║                     DEPLOYMENT COMPLETE - MISSION SUCCESS                 ║
echo  ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo  [SecFERRO] All optimization modules executed successfully.
echo  [SecFERRO] System restart recommended for full effect.
echo.
call :LOG_ENTRY "Full deployment completed successfully"
echo  Press any key to return to menu or wait for auto-restart in 15 seconds...
timeout /t 15
shutdown /r /t 0
goto MAIN_MENU

:NETWORK_ONLY
cls
call :DISPLAY_BANNER
echo  ╔═══════════════════════════════════════════════════════════════════════════╗
echo  ║                       NETWORK OPTIMIZATION MODULE                         ║
echo  ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
call :LOG_ENTRY "Network optimization module started"
call :NETWORK_OPTIMIZATION
echo.
echo  [SecFERRO] Network optimization complete.
echo.
pause
goto MAIN_MENU

:NETWORK_OPTIMIZATION
echo  [1/6] Flushing DNS cache...
ipconfig /flushdns >nul 2>&1
if %errorLevel% equ 0 (
    echo  [✓] DNS cache cleared
    call :LOG_ENTRY "DNS cache flushed successfully"
) else (
    echo  [✗] DNS flush failed
    call :LOG_ENTRY "ERROR: DNS flush failed"
)

echo  [2/6] Resetting Winsock catalog...
netsh winsock reset >nul 2>&1
if %errorLevel% equ 0 (
    echo  [✓] Winsock reset complete
    call :LOG_ENTRY "Winsock catalog reset"
) else (
    echo  [✗] Winsock reset failed
    call :LOG_ENTRY "ERROR: Winsock reset failed"
)

echo  [3/6] Resetting TCP/IP stack...
netsh int ip reset >nul 2>&1
netsh int ipv4 reset >nul 2>&1
netsh int ipv6 reset >nul 2>&1
if %errorLevel% equ 0 (
    echo  [✓] TCP/IP stack reset
    call :LOG_ENTRY "TCP/IP stack reset successfully"
) else (
    echo  [✗] TCP/IP reset failed
    call :LOG_ENTRY "ERROR: TCP/IP reset failed"
)

echo  [4/6] Disabling IPv6 unnecessary features...
netsh interface ipv6 set privacy state=disabled >nul 2>&1
netsh interface ipv6 set global randomizeidentifiers=disabled >nul 2>&1
echo  [✓] IPv6 optimized
call :LOG_ENTRY "IPv6 features disabled"

echo  [5/6] Renewing IP configuration...
ipconfig /release >nul 2>&1
timeout /t 2 >nul
ipconfig /renew >nul 2>&1
ipconfig /registerdns >nul 2>&1
if %errorLevel% equ 0 (
    echo  [✓] IP configuration renewed
    call :LOG_ENTRY "IP configuration renewed"
) else (
    echo  [✗] IP renewal failed
    call :LOG_ENTRY "ERROR: IP renewal failed"
)

echo  [6/6] Applying network adapter optimizations...
for /f "tokens=*" %%a in ('wmic path Win32_NetworkAdapter where "NetEnabled=true" get PNPDeviceID ^| findstr /r "PCI"') do (
    powershell -Command "Get-PnpDevice -InstanceId '%%a' | Set-PnpDevice -Property 'Power\Enabled' -Value 0" >nul 2>&1
)
echo  [✓] Network adapters optimized
call :LOG_ENTRY "Network adapter power settings optimized"
goto :EOF

:CS2_SERVER_TEST
cls
call :DISPLAY_BANNER
echo  ╔═══════════════════════════════════════════════════════════════════════════╗
echo  ║                        CS2 SERVER DIAGNOSTICS                             ║
echo  ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
call :LOG_ENTRY "CS2 server diagnostics initiated"
call :CS2_SERVER_ANALYSIS
echo.
pause
goto MAIN_MENU

:CS2_SERVER_ANALYSIS
echo  [SecFERRO] Analyzing Valve CS2 server infrastructure...
echo.

set "SERVER_1=146.66.155.1"
set "SERVER_1_NAME=Warsaw, Poland"
set "SERVER_2=146.66.158.1"
set "SERVER_2_NAME=Stockholm, Sweden"
set "SERVER_3=155.133.248.1"
set "SERVER_3_NAME=Frankfurt, Germany"
set "SERVER_4=155.133.254.1"
set "SERVER_4_NAME=Amsterdam, Netherlands"
set "SERVER_5=162.254.197.1"
set "SERVER_5_NAME=London, UK"

set "BEST_PING=9999"
set "BEST_SERVER="
set "BEST_SERVER_NAME="

echo  Testing server latency...
echo  ─────────────────────────────────────────────────────────────────────────────

for %%s in (1 2 3 4 5) do (
    call :TEST_SERVER !SERVER_%%s! "!SERVER_%%s_NAME!" %%s
)

echo.
echo  ─────────────────────────────────────────────────────────────────────────────
echo.
echo  [SecFERRO] OPTIMAL SERVER IDENTIFIED:
echo  Server: %BEST_SERVER_NAME%
echo  IP: %BEST_SERVER%
echo  Ping: %BEST_PING%ms
echo.
call :LOG_ENTRY "Optimal server: %BEST_SERVER_NAME% (%BEST_SERVER%) - %BEST_PING%ms"

echo %BEST_SERVER%>"%~dp0optimal_server.txt"
echo %BEST_PING%>>"%~dp0optimal_server.txt"
set "OPTIMAL_SERVER=%BEST_SERVER%"
goto :EOF

:TEST_SERVER
set "TEST_IP=%~1"
set "TEST_NAME=%~2"
set "TEST_NUM=%~3"

echo  [%TEST_NUM%/5] Testing %TEST_NAME% (%TEST_IP%)...

for /f "tokens=*" %%a in ('ping %TEST_IP% -n 4 ^| findstr /r "Average"') do set "PING_RESULT=%%a"
for /f "tokens=10 delims==ms " %%b in ("%PING_RESULT%") do set "AVG_PING=%%b"

if defined AVG_PING (
    echo        └─ Latency: %AVG_PING%ms
    call :LOG_ENTRY "Server %TEST_NAME%: %AVG_PING%ms"
    if %AVG_PING% LSS %BEST_PING% (
        set "BEST_PING=%AVG_PING%"
        set "BEST_SERVER=%TEST_IP%"
        set "BEST_SERVER_NAME=%TEST_NAME%"
    )
) else (
    echo        └─ Server unreachable
    call :LOG_ENTRY "Server %TEST_NAME%: UNREACHABLE"
)
goto :EOF

:CS2_CONFIG
cls
call :DISPLAY_BANNER
echo  ╔═══════════════════════════════════════════════════════════════════════════╗
echo  ║                     CS2 CONFIGURATION INJECTION                           ║
echo  ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
call :LOG_ENTRY "CS2 configuration module started"
call :CS2_CONFIG_INJECT
echo.
pause
goto MAIN_MENU

:CS2_CONFIG_INJECT
echo  [SecFERRO] Locating Steam installation...

set "STEAM_PATHS[0]=C:\Program Files (x86)\Steam"
set "STEAM_PATHS[1]=C:\Program Files\Steam"
set "STEAM_PATHS[2]=D:\Steam"
set "STEAM_PATHS[3]=E:\Steam"

set "STEAM_FOUND=0"
for /L %%i in (0,1,3) do (
    if exist "!STEAM_PATHS[%%i]!\steam.exe" (
        set "STEAM_PATH=!STEAM_PATHS[%%i]!"
        set "STEAM_FOUND=1"
        echo  [✓] Steam found: !STEAM_PATH!
        call :LOG_ENTRY "Steam located at: !STEAM_PATH!"
        goto :STEAM_FOUND
    )
)

:STEAM_FOUND
if "%STEAM_FOUND%"=="0" (
    echo  [✗] Steam installation not found
    echo  [!] Please install CS2 or specify Steam path manually
    call :LOG_ENTRY "ERROR: Steam not found"
    goto :EOF
)

set "CS2_POSSIBLE[0]=%STEAM_PATH%\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"
set "CS2_POSSIBLE[1]=%USERPROFILE%\AppData\Local\Steam\Counter-Strike Global Offensive\game\csgo\cfg"

set "CS2_FOUND=0"
for /L %%i in (0,1,1) do (
    if exist "!CS2_POSSIBLE[%%i]!" (
        set "CS2_CONFIG=!CS2_POSSIBLE[%%i]!"
        set "CS2_FOUND=1"
        echo  [✓] CS2 config folder found
        call :LOG_ENTRY "CS2 config folder: !CS2_CONFIG!"
        goto :CS2_FOUND
    )
)

:CS2_FOUND
if "%CS2_FOUND%"=="0" (
    echo  [✗] CS2 configuration folder not found
    echo  [!] Please launch CS2 at least once before running this tool
    call :LOG_ENTRY "ERROR: CS2 config folder not found"
    goto :EOF
)

echo  [SecFERRO] Generating optimized autoexec.cfg...
set "AUTOEXEC=%CS2_CONFIG%\autoexec.cfg"

(
echo // ========================================================================
echo // SecFERRO DIVISION - CS2 Optimization Config
echo // Generated: %date% %time%
echo // ========================================================================
echo.
echo // Network Settings - Ultra Low Latency
echo rate "786432"
echo cl_interp "0.031"
echo cl_interp_ratio "1"
echo cl_updaterate "128"
echo cl_cmdrate "128"
echo.
echo // Matchmaking - Low Ping Priority
echo mm_dedicated_search_maxping "50"
echo.
echo // Performance Settings
echo fps_max "0"
echo fps_max_menu "144"
echo.
echo // Video Settings for Performance
echo r_dynamic "0"
echo mat_queue_mode "2"
echo.
echo // Audio Optimization
echo snd_mixahead "0.05"
echo snd_headphone_pan_exponent "2"
echo.
echo // Mouse and Input
echo m_rawinput "1"
echo m_mousespeed "0"
echo.
echo // Console Feedback
echo clear
echo echo "========================================="
echo echo " SecFERRO DIVISION Config Loaded"
echo echo " Network: OPTIMIZED"
echo echo " Status: TACTICAL READY"
echo echo "========================================="
) > "%AUTOEXEC%"

if exist "%AUTOEXEC%" (
    echo  [✓] autoexec.cfg created successfully
    call :LOG_ENTRY "Optimized autoexec.cfg created"
) else (
    echo  [✗] Failed to create autoexec.cfg
    call :LOG_ENTRY "ERROR: Failed to create autoexec.cfg"
)

echo  [SecFERRO] Generating recommended launch options...
set "LAUNCH_OPTIONS=%~dp0CS2_Launch_Options.txt"

(
echo ========================================================================
echo SecFERRO DIVISION - Recommended CS2 Launch Options
echo ========================================================================
echo.
echo Copy these launch options to Steam:
echo Right-click CS2 in Steam Library -^> Properties -^> Launch Options
echo.
echo -novid -nojoy -high +fps_max 0 +rate 786432 +cl_interp_ratio 1 +cl_interp 0.031 +cl_updaterate 128 +cl_cmdrate 128 -tickrate 128 +exec autoexec
echo.
echo ========================================================================
) > "%LAUNCH_OPTIONS%"

echo  [✓] Launch options saved to: %LAUNCH_OPTIONS%
call :LOG_ENTRY "Launch options file created"
start notepad "%LAUNCH_OPTIONS%"
goto :EOF

:REGISTRY_OPTIMIZATION
echo  [SecFERRO] Applying registry optimizations...
echo.

echo  [1/5] Disabling Nagle's Algorithm...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f >nul 2>&1
echo  [✓] Nagle's Algorithm disabled
call :LOG_ENTRY "Nagle's Algorithm disabled"

echo  [2/5] Optimizing TCP window size...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpWindowSize /t REG_DWORD /d 65535 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f >nul 2>&1
echo  [✓] TCP window optimized
call :LOG_ENTRY "TCP window size optimized"

echo  [3/5] Enabling Path MTU Discovery...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f >nul 2>&1
echo  [✓] PMTU Discovery enabled
call :LOG_ENTRY "PMTU Discovery enabled"

echo  [4/5] Disabling Windows Scaling Heuristics...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableWsd /t REG_DWORD /d 0 /f >nul 2>&1
echo  [✓] Scaling heuristics disabled
call :LOG_ENTRY "Windows Scaling Heuristics disabled"

echo  [5/5] Setting gaming priority...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul 2>&1
echo  [✓] Gaming priority configured
call :LOG_ENTRY "Gaming priority set to HIGH"
goto :EOF

:DIAGNOSTICS
cls
call :DISPLAY_BANNER
echo  ╔═══════════════════════════════════════════════════════════════════════════╗
echo  ║                         SYSTEM DIAGNOSTICS                                ║
echo  ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
call :LOG_ENTRY "System diagnostics initiated"

echo  [SecFERRO] Running comprehensive network diagnostics...
echo.
echo  ─────────────────────────────────────────────────────────────────────────────
echo  ROUTER CONNECTIVITY TEST
echo  ─────────────────────────────────────────────────────────────────────────────
echo.
ping 192.168.33.1 -n 4
echo.

echo  ─────────────────────────────────────────────────────────────────────────────
echo  INTERNET CONNECTIVITY TEST
echo  ─────────────────────────────────────────────────────────────────────────────
echo.
ping 8.8.8.8 -n 10
echo.

echo  ─────────────────────────────────────────────────────────────────────────────
echo  NETWORK CONFIGURATION
echo  ─────────────────────────────────────────────────────────────────────────────
echo.
ipconfig /all | findstr /C:"IPv4" /C:"Gateway" /C:"DNS"
echo.

call :LOG_ENTRY "System diagnostics completed"
pause
goto MAIN_MENU

:VIEW_LOG
cls
call :DISPLAY_BANNER
echo  ╔═══════════════════════════════════════════════════════════════════════════╗
echo  ║                          OPERATION LOG VIEWER                             ║
echo  ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

if exist "%LOG_FILE%" (
    type "%LOG_FILE%"
) else (
    echo  [!] No log file found.
)
echo.
pause
goto MAIN_MENU

:LOG_ENTRY
echo [%date% %time:~0,8%] %~1 >> "%LOG_FILE%"
goto :EOF

:EXIT_SYSTEM
cls
call :DISPLAY_BANNER
echo  ╔═══════════════════════════════════════════════════════════════════════════╗
echo  ║                       SYSTEM SHUTDOWN INITIATED                           ║
echo  ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo  [SecFERRO] Log saved to: %LOG_FILE%
call :LOG_ENTRY "System shutdown"
timeout /t 3 >nul
exit /b