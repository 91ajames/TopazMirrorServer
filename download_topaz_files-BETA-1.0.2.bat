@echo off
title Topaz Model Downloader
color 0A
setlocal DisableDelayedExpansion
set "STARTTIME=%TIME%"
set "DEST=C:\TopazMirror\v1"
set "MIRROR_ROOT=C:\TopazMirror"
set "BASE_URL=http://models.topazlabs.com/v1"

echo ===========================================
echo         Topaz Model Downloader
echo         Version: BETA 1.0.2
echo ===========================================
echo.

if not exist "%MIRROR_ROOT%" mkdir "%MIRROR_ROOT%"
if not exist "%DEST%" mkdir "%DEST%"
if not exist "%MIRROR_ROOT%\_test" mkdir "%MIRROR_ROOT%\_test"
if not exist "%MIRROR_ROOT%\1.1" mkdir "%MIRROR_ROOT%\1.1"
if not exist "%DEST%\track" mkdir "%DEST%\track"

if not exist "%MIRROR_ROOT%\_test\models-bal-test.txt" echo Connected!>"%MIRROR_ROOT%\_test\models-bal-test.txt"
if not exist "%MIRROR_ROOT%\1.1\test.txt" echo Connected!>"%MIRROR_ROOT%\1.1\test.txt"
if not exist "%DEST%\track\OK.txt" echo OK>"%DEST%\track\OK.txt"

cd /d "%DEST%"
echo Download folder:
echo %CD%
echo.

echo Checking network...
netsh interface show interface | findstr /i "Connected" >nul
if errorlevel 1 goto NO_ADAPTER
curl --silent --head --connect-timeout 5 "%BASE_URL%/" >nul 2>&1
if errorlevel 1 goto NO_INTERNET
echo [ONLINE] Internet detected.
goto START_DOWNLOAD

:NO_ADAPTER
echo [OFFLINE] No Ethernet or Wi-Fi adapter connected.
goto START_DOWNLOAD

:NO_INTERNET
echo [OFFLINE] Adapter connected, but Internet unavailable.
goto START_DOWNLOAD

:START_DOWNLOAD
echo.
echo ===========================================
echo          Network check complete.
echo      Starting download in 3 seconds...
echo ===========================================
timeout /t 3 /nobreak >nul
echo.

echo [1/325] apnb-v2-fp16-512x512-rev2-ox.tz2
if exist "%DEST%\apnb-v2-fp16-512x512-rev2-ox.tz2" goto SKIP_0001
curl -L --fail --retry 3 -o "%DEST%\apnb-v2-fp16-512x512-rev2-ox.tz2" "%BASE_URL%/apnb-v2-fp16-512x512-rev2-ox.tz2"
goto NEXT_0001
:SKIP_0001
echo Already exists. Skipping.
:NEXT_0001
echo.

echo [2/325] apnb-v2-fp32-512x512-ov.tz2
if exist "%DEST%\apnb-v2-fp32-512x512-ov.tz2" goto SKIP_0002
curl -L --fail --retry 3 -o "%DEST%\apnb-v2-fp32-512x512-ov.tz2" "%BASE_URL%/apnb-v2-fp32-512x512-ov.tz2"
goto NEXT_0002
:SKIP_0002
echo Already exists. Skipping.
:NEXT_0002
echo.

echo [3/325] apnb-v2-fp32-512x512-ox.tz2
if exist "%DEST%\apnb-v2-fp32-512x512-ox.tz2" goto SKIP_0003
curl -L --fail --retry 3 -o "%DEST%\apnb-v2-fp32-512x512-ox.tz2" "%BASE_URL%/apnb-v2-fp32-512x512-ox.tz2"
goto NEXT_0003
:SKIP_0003
echo Already exists. Skipping.
:NEXT_0003
echo.

echo [4/325] claa-v1-fp32-512x512-ov.tz
if exist "%DEST%\claa-v1-fp32-512x512-ov.tz" goto SKIP_0004
curl -L --fail --retry 3 -o "%DEST%\claa-v1-fp32-512x512-ov.tz" "%BASE_URL%/claa-v1-fp32-512x512-ov.tz"
goto NEXT_0004
:SKIP_0004
echo Already exists. Skipping.
:NEXT_0004
echo.

echo [5/325] claa-v1-fp32-512x512-ov.tz2
if exist "%DEST%\claa-v1-fp32-512x512-ov.tz2" goto SKIP_0005
curl -L --fail --retry 3 -o "%DEST%\claa-v1-fp32-512x512-ov.tz2" "%BASE_URL%/claa-v1-fp32-512x512-ov.tz2"
goto NEXT_0005
:SKIP_0005
echo Already exists. Skipping.
:NEXT_0005
echo.

echo [6/325] claa-v1-fp32-512x512-ox.tz
if exist "%DEST%\claa-v1-fp32-512x512-ox.tz" goto SKIP_0006
curl -L --fail --retry 3 -o "%DEST%\claa-v1-fp32-512x512-ox.tz" "%BASE_URL%/claa-v1-fp32-512x512-ox.tz"
goto NEXT_0006
:SKIP_0006
echo Already exists. Skipping.
:NEXT_0006
echo.

echo [7/325] claa-v1-fp32-512x512-ox.tz2
if exist "%DEST%\claa-v1-fp32-512x512-ox.tz2" goto SKIP_0007
curl -L --fail --retry 3 -o "%DEST%\claa-v1-fp32-512x512-ox.tz2" "%BASE_URL%/claa-v1-fp32-512x512-ox.tz2"
goto NEXT_0007
:SKIP_0007
echo Already exists. Skipping.
:NEXT_0007
echo.

echo [8/325] claae-v1-fp32-512x512-ov.tz2
if exist "%DEST%\claae-v1-fp32-512x512-ov.tz2" goto SKIP_0008
curl -L --fail --retry 3 -o "%DEST%\claae-v1-fp32-512x512-ov.tz2" "%BASE_URL%/claae-v1-fp32-512x512-ov.tz2"
goto NEXT_0008
:SKIP_0008
echo Already exists. Skipping.
:NEXT_0008
echo.

echo [9/325] claae-v1-fp32-512x512-ox.tz2
if exist "%DEST%\claae-v1-fp32-512x512-ox.tz2" goto SKIP_0009
curl -L --fail --retry 3 -o "%DEST%\claae-v1-fp32-512x512-ox.tz2" "%BASE_URL%/claae-v1-fp32-512x512-ox.tz2"
goto NEXT_0009
:SKIP_0009
echo Already exists. Skipping.
:NEXT_0009
echo.

echo [10/325] clc-v2-fp32-512x512-ov.tz2
if exist "%DEST%\clc-v2-fp32-512x512-ov.tz2" goto SKIP_0010
curl -L --fail --retry 3 -o "%DEST%\clc-v2-fp32-512x512-ov.tz2" "%BASE_URL%/clc-v2-fp32-512x512-ov.tz2"
goto NEXT_0010
:SKIP_0010
echo Already exists. Skipping.
:NEXT_0010
echo.

echo [11/325] clc-v3-fp16-512x512-ox.tz2
if exist "%DEST%\clc-v3-fp16-512x512-ox.tz2" goto SKIP_0011
curl -L --fail --retry 3 -o "%DEST%\clc-v3-fp16-512x512-ox.tz2" "%BASE_URL%/clc-v3-fp16-512x512-ox.tz2"
goto NEXT_0011
:SKIP_0011
echo Already exists. Skipping.
:NEXT_0011
echo.

echo [12/325] clc-v3-fp32-512x512-ox.tz2
if exist "%DEST%\clc-v3-fp32-512x512-ox.tz2" goto SKIP_0012
curl -L --fail --retry 3 -o "%DEST%\clc-v3-fp32-512x512-ox.tz2" "%BASE_URL%/clc-v3-fp32-512x512-ox.tz2"
goto NEXT_0012
:SKIP_0012
echo Already exists. Skipping.
:NEXT_0012
echo.

echo [13/325] daclip-v1-fp32-224x224-1x-ov.tz
if exist "%DEST%\daclip-v1-fp32-224x224-1x-ov.tz" goto SKIP_0013
curl -L --fail --retry 3 -o "%DEST%\daclip-v1-fp32-224x224-1x-ov.tz" "%BASE_URL%/daclip-v1-fp32-224x224-1x-ov.tz"
goto NEXT_0013
:SKIP_0013
echo Already exists. Skipping.
:NEXT_0013
echo.

echo [14/325] daclip-v3-fp16-256x256-rev1-ox.tz2
if exist "%DEST%\daclip-v3-fp16-256x256-rev1-ox.tz2" goto SKIP_0014
curl -L --fail --retry 3 -o "%DEST%\daclip-v3-fp16-256x256-rev1-ox.tz2" "%BASE_URL%/daclip-v3-fp16-256x256-rev1-ox.tz2"
goto NEXT_0014
:SKIP_0014
echo Already exists. Skipping.
:NEXT_0014
echo.

echo [15/325] daclip-v3-fp32-256x256-ox.tz2
if exist "%DEST%\daclip-v3-fp32-256x256-ox.tz2" goto SKIP_0015
curl -L --fail --retry 3 -o "%DEST%\daclip-v3-fp32-256x256-ox.tz2" "%BASE_URL%/daclip-v3-fp32-256x256-ox.tz2"
goto NEXT_0015
:SKIP_0015
echo Already exists. Skipping.
:NEXT_0015
echo.

echo [16/325] default_prompt.bin
if exist "%DEST%\default_prompt.bin" goto SKIP_0016
curl -L --fail --retry 3 -o "%DEST%\default_prompt.bin" "%BASE_URL%/default_prompt.bin"
goto NEXT_0016
:SKIP_0016
echo Already exists. Skipping.
:NEXT_0016
echo.

echo [17/325] dnt_beta-v5-fp32-512x512-ov.tz2
if exist "%DEST%\dnt_beta-v5-fp32-512x512-ov.tz2" goto SKIP_0017
curl -L --fail --retry 3 -o "%DEST%\dnt_beta-v5-fp32-512x512-ov.tz2" "%BASE_URL%/dnt_beta-v5-fp32-512x512-ov.tz2"
goto NEXT_0017
:SKIP_0017
echo Already exists. Skipping.
:NEXT_0017
echo.

echo [18/325] dnt_beta-v5-fp32-512x512-ox.tz2
if exist "%DEST%\dnt_beta-v5-fp32-512x512-ox.tz2" goto SKIP_0018
curl -L --fail --retry 3 -o "%DEST%\dnt_beta-v5-fp32-512x512-ox.tz2" "%BASE_URL%/dnt_beta-v5-fp32-512x512-ox.tz2"
goto NEXT_0018
:SKIP_0018
echo Already exists. Skipping.
:NEXT_0018
echo.

echo [19/325] draw_linear-v1-fp32-512x512-ov.tz2
if exist "%DEST%\draw_linear-v1-fp32-512x512-ov.tz2" goto SKIP_0019
curl -L --fail --retry 3 -o "%DEST%\draw_linear-v1-fp32-512x512-ov.tz2" "%BASE_URL%/draw_linear-v1-fp32-512x512-ov.tz2"
goto NEXT_0019
:SKIP_0019
echo Already exists. Skipping.
:NEXT_0019
echo.

echo [20/325] draw_linear-v1-fp32-512x512-ox.tz2
if exist "%DEST%\draw_linear-v1-fp32-512x512-ox.tz2" goto SKIP_0020
curl -L --fail --retry 3 -o "%DEST%\draw_linear-v1-fp32-512x512-ox.tz2" "%BASE_URL%/draw_linear-v1-fp32-512x512-ox.tz2"
goto NEXT_0020
:SKIP_0020
echo Already exists. Skipping.
:NEXT_0020
echo.

echo [21/325] drw_native-v1-fp16-512x512-ov.tz2
if exist "%DEST%\drw_native-v1-fp16-512x512-ov.tz2" goto SKIP_0021
curl -L --fail --retry 3 -o "%DEST%\drw_native-v1-fp16-512x512-ov.tz2" "%BASE_URL%/drw_native-v1-fp16-512x512-ov.tz2"
goto NEXT_0021
:SKIP_0021
echo Already exists. Skipping.
:NEXT_0021
echo.

echo [22/325] drw_native-v1-fp32-512x512-ox.tz2
if exist "%DEST%\drw_native-v1-fp32-512x512-ox.tz2" goto SKIP_0022
curl -L --fail --retry 3 -o "%DEST%\drw_native-v1-fp32-512x512-ox.tz2" "%BASE_URL%/drw_native-v1-fp32-512x512-ox.tz2"
goto NEXT_0022
:SKIP_0022
echo Already exists. Skipping.
:NEXT_0022
echo.

echo [23/325] drw_standard-v1-fp16-512x512-ov.tz2
if exist "%DEST%\drw_standard-v1-fp16-512x512-ov.tz2" goto SKIP_0023
curl -L --fail --retry 3 -o "%DEST%\drw_standard-v1-fp16-512x512-ov.tz2" "%BASE_URL%/drw_standard-v1-fp16-512x512-ov.tz2"
goto NEXT_0023
:SKIP_0023
echo Already exists. Skipping.
:NEXT_0023
echo.

echo [24/325] drw_standard-v1-fp32-512x512-ox.tz2
if exist "%DEST%\drw_standard-v1-fp32-512x512-ox.tz2" goto SKIP_0024
curl -L --fail --retry 3 -o "%DEST%\drw_standard-v1-fp32-512x512-ox.tz2" "%BASE_URL%/drw_standard-v1-fp32-512x512-ox.tz2"
goto NEXT_0024
:SKIP_0024
echo Already exists. Skipping.
:NEXT_0024
echo.

echo [25/325] dswn_dec-v1-fp32-128x128-ox.tz2
if exist "%DEST%\dswn_dec-v1-fp32-128x128-ox.tz2" goto SKIP_0025
curl -L --fail --retry 3 -o "%DEST%\dswn_dec-v1-fp32-128x128-ox.tz2" "%BASE_URL%/dswn_dec-v1-fp32-128x128-ox.tz2"
goto NEXT_0025
:SKIP_0025
echo Already exists. Skipping.
:NEXT_0025
echo.

echo [26/325] dswn_dec-v1-fp32-128x128.onnx.data
if exist "%DEST%\dswn_dec-v1-fp32-128x128.onnx.data" goto SKIP_0026
curl -L --fail --retry 3 -o "%DEST%\dswn_dec-v1-fp32-128x128.onnx.data" "%BASE_URL%/dswn_dec-v1-fp32-128x128.onnx.data"
goto NEXT_0026
:SKIP_0026
echo Already exists. Skipping.
:NEXT_0026
echo.

echo [27/325] dswn_dit-v1-fp16-128x128-rev1-ox.tz2
if exist "%DEST%\dswn_dit-v1-fp16-128x128-rev1-ox.tz2" goto SKIP_0027
curl -L --fail --retry 3 -o "%DEST%\dswn_dit-v1-fp16-128x128-rev1-ox.tz2" "%BASE_URL%/dswn_dit-v1-fp16-128x128-rev1-ox.tz2"
goto NEXT_0027
:SKIP_0027
echo Already exists. Skipping.
:NEXT_0027
echo.

echo [28/325] dswn_dit-v1-fp16-128x128-rev1.onnx.data
if exist "%DEST%\dswn_dit-v1-fp16-128x128-rev1.onnx.data" goto SKIP_0028
curl -L --fail --retry 3 -o "%DEST%\dswn_dit-v1-fp16-128x128-rev1.onnx.data" "%BASE_URL%/dswn_dit-v1-fp16-128x128-rev1.onnx.data"
goto NEXT_0028
:SKIP_0028
echo Already exists. Skipping.
:NEXT_0028
echo.

echo [29/325] dswn_enc-v1-fp32-1024x1024-ox.tz2
if exist "%DEST%\dswn_enc-v1-fp32-1024x1024-ox.tz2" goto SKIP_0029
curl -L --fail --retry 3 -o "%DEST%\dswn_enc-v1-fp32-1024x1024-ox.tz2" "%BASE_URL%/dswn_enc-v1-fp32-1024x1024-ox.tz2"
goto NEXT_0029
:SKIP_0029
echo Already exists. Skipping.
:NEXT_0029
echo.

echo [30/325] dswn_enc-v1-fp32-1024x1024.onnx.data
if exist "%DEST%\dswn_enc-v1-fp32-1024x1024.onnx.data" goto SKIP_0030
curl -L --fail --retry 3 -o "%DEST%\dswn_enc-v1-fp32-1024x1024.onnx.data" "%BASE_URL%/dswn_enc-v1-fp32-1024x1024.onnx.data"
goto NEXT_0030
:SKIP_0030
echo Already exists. Skipping.
:NEXT_0030
echo.

echo [31/325] expog-v1-fp16-512x512-1x-ov.tz2
if exist "%DEST%\expog-v1-fp16-512x512-1x-ov.tz2" goto SKIP_0031
curl -L --fail --retry 3 -o "%DEST%\expog-v1-fp16-512x512-1x-ov.tz2" "%BASE_URL%/expog-v1-fp16-512x512-1x-ov.tz2"
goto NEXT_0031
:SKIP_0031
echo Already exists. Skipping.
:NEXT_0031
echo.

echo [32/325] expog-v1-fp16-512x512-1x-ox.tz2
if exist "%DEST%\expog-v1-fp16-512x512-1x-ox.tz2" goto SKIP_0032
curl -L --fail --retry 3 -o "%DEST%\expog-v1-fp16-512x512-1x-ox.tz2" "%BASE_URL%/expog-v1-fp16-512x512-1x-ox.tz2"
goto NEXT_0032
:SKIP_0032
echo Already exists. Skipping.
:NEXT_0032
echo.

echo [33/325] expoi-v1-fp32-256x256-1x-ov.tz2
if exist "%DEST%\expoi-v1-fp32-256x256-1x-ov.tz2" goto SKIP_0033
curl -L --fail --retry 3 -o "%DEST%\expoi-v1-fp32-256x256-1x-ov.tz2" "%BASE_URL%/expoi-v1-fp32-256x256-1x-ov.tz2"
goto NEXT_0033
:SKIP_0033
echo Already exists. Skipping.
:NEXT_0033
echo.

echo [34/325] expoi-v1-fp32-256x256-1x-ox.tz2
if exist "%DEST%\expoi-v1-fp32-256x256-1x-ox.tz2" goto SKIP_0034
curl -L --fail --retry 3 -o "%DEST%\expoi-v1-fp32-256x256-1x-ox.tz2" "%BASE_URL%/expoi-v1-fp32-256x256-1x-ox.tz2"
goto NEXT_0034
:SKIP_0034
echo Already exists. Skipping.
:NEXT_0034
echo.

echo [35/325] gclc-v1-fp16-128x128-2x-ov.tz
if exist "%DEST%\gclc-v1-fp16-128x128-2x-ov.tz" goto SKIP_0035
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp16-128x128-2x-ov.tz" "%BASE_URL%/gclc-v1-fp16-128x128-2x-ov.tz"
goto NEXT_0035
:SKIP_0035
echo Already exists. Skipping.
:NEXT_0035
echo.

echo [36/325] gclc-v1-fp16-128x128-2x-ov.tz2
if exist "%DEST%\gclc-v1-fp16-128x128-2x-ov.tz2" goto SKIP_0036
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp16-128x128-2x-ov.tz2" "%BASE_URL%/gclc-v1-fp16-128x128-2x-ov.tz2"
goto NEXT_0036
:SKIP_0036
echo Already exists. Skipping.
:NEXT_0036
echo.

echo [37/325] gclc-v1-fp16-128x128-4x-ov.tz
if exist "%DEST%\gclc-v1-fp16-128x128-4x-ov.tz" goto SKIP_0037
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp16-128x128-4x-ov.tz" "%BASE_URL%/gclc-v1-fp16-128x128-4x-ov.tz"
goto NEXT_0037
:SKIP_0037
echo Already exists. Skipping.
:NEXT_0037
echo.

echo [38/325] gclc-v1-fp16-128x128-4x-ov.tz2
if exist "%DEST%\gclc-v1-fp16-128x128-4x-ov.tz2" goto SKIP_0038
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp16-128x128-4x-ov.tz2" "%BASE_URL%/gclc-v1-fp16-128x128-4x-ov.tz2"
goto NEXT_0038
:SKIP_0038
echo Already exists. Skipping.
:NEXT_0038
echo.

echo [39/325] gclc-v1-fp16-192x192-2x-ov.tz
if exist "%DEST%\gclc-v1-fp16-192x192-2x-ov.tz" goto SKIP_0039
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp16-192x192-2x-ov.tz" "%BASE_URL%/gclc-v1-fp16-192x192-2x-ov.tz"
goto NEXT_0039
:SKIP_0039
echo Already exists. Skipping.
:NEXT_0039
echo.

echo [40/325] gclc-v1-fp16-192x192-2x-ov.tz2
if exist "%DEST%\gclc-v1-fp16-192x192-2x-ov.tz2" goto SKIP_0040
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp16-192x192-2x-ov.tz2" "%BASE_URL%/gclc-v1-fp16-192x192-2x-ov.tz2"
goto NEXT_0040
:SKIP_0040
echo Already exists. Skipping.
:NEXT_0040
echo.

echo [41/325] gclc-v1-fp16-192x192-4x-ov.tz
if exist "%DEST%\gclc-v1-fp16-192x192-4x-ov.tz" goto SKIP_0041
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp16-192x192-4x-ov.tz" "%BASE_URL%/gclc-v1-fp16-192x192-4x-ov.tz"
goto NEXT_0041
:SKIP_0041
echo Already exists. Skipping.
:NEXT_0041
echo.

echo [42/325] gclc-v1-fp16-192x192-4x-ov.tz2
if exist "%DEST%\gclc-v1-fp16-192x192-4x-ov.tz2" goto SKIP_0042
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp16-192x192-4x-ov.tz2" "%BASE_URL%/gclc-v1-fp16-192x192-4x-ov.tz2"
goto NEXT_0042
:SKIP_0042
echo Already exists. Skipping.
:NEXT_0042
echo.

echo [43/325] gclc-v1-fp16-96x96-2x-ov.tz2
if exist "%DEST%\gclc-v1-fp16-96x96-2x-ov.tz2" goto SKIP_0043
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp16-96x96-2x-ov.tz2" "%BASE_URL%/gclc-v1-fp16-96x96-2x-ov.tz2"
goto NEXT_0043
:SKIP_0043
echo Already exists. Skipping.
:NEXT_0043
echo.

echo [44/325] gclc-v1-fp16-96x96-4x-ov.tz2
if exist "%DEST%\gclc-v1-fp16-96x96-4x-ov.tz2" goto SKIP_0044
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp16-96x96-4x-ov.tz2" "%BASE_URL%/gclc-v1-fp16-96x96-4x-ov.tz2"
goto NEXT_0044
:SKIP_0044
echo Already exists. Skipping.
:NEXT_0044
echo.

echo [45/325] gclc-v1-fp32-128x128-2x-ox.tz
if exist "%DEST%\gclc-v1-fp32-128x128-2x-ox.tz" goto SKIP_0045
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-128x128-2x-ox.tz" "%BASE_URL%/gclc-v1-fp32-128x128-2x-ox.tz"
goto NEXT_0045
:SKIP_0045
echo Already exists. Skipping.
:NEXT_0045
echo.

echo [46/325] gclc-v1-fp32-128x128-2x-ox.tz2
if exist "%DEST%\gclc-v1-fp32-128x128-2x-ox.tz2" goto SKIP_0046
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-128x128-2x-ox.tz2" "%BASE_URL%/gclc-v1-fp32-128x128-2x-ox.tz2"
goto NEXT_0046
:SKIP_0046
echo Already exists. Skipping.
:NEXT_0046
echo.

echo [47/325] gclc-v1-fp32-128x128-4x-ox.tz
if exist "%DEST%\gclc-v1-fp32-128x128-4x-ox.tz" goto SKIP_0047
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-128x128-4x-ox.tz" "%BASE_URL%/gclc-v1-fp32-128x128-4x-ox.tz"
goto NEXT_0047
:SKIP_0047
echo Already exists. Skipping.
:NEXT_0047
echo.

echo [48/325] gclc-v1-fp32-128x128-4x-ox.tz2
if exist "%DEST%\gclc-v1-fp32-128x128-4x-ox.tz2" goto SKIP_0048
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-128x128-4x-ox.tz2" "%BASE_URL%/gclc-v1-fp32-128x128-4x-ox.tz2"
goto NEXT_0048
:SKIP_0048
echo Already exists. Skipping.
:NEXT_0048
echo.

echo [49/325] gclc-v1-fp32-192x192-1x-ov.tz
if exist "%DEST%\gclc-v1-fp32-192x192-1x-ov.tz" goto SKIP_0049
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-192x192-1x-ov.tz" "%BASE_URL%/gclc-v1-fp32-192x192-1x-ov.tz"
goto NEXT_0049
:SKIP_0049
echo Already exists. Skipping.
:NEXT_0049
echo.

echo [50/325] gclc-v1-fp32-192x192-1x-ov.tz2
if exist "%DEST%\gclc-v1-fp32-192x192-1x-ov.tz2" goto SKIP_0050
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-192x192-1x-ov.tz2" "%BASE_URL%/gclc-v1-fp32-192x192-1x-ov.tz2"
goto NEXT_0050
:SKIP_0050
echo Already exists. Skipping.
:NEXT_0050
echo.

echo [51/325] gclc-v1-fp32-192x192-1x-ox.tz2
if exist "%DEST%\gclc-v1-fp32-192x192-1x-ox.tz2" goto SKIP_0051
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-192x192-1x-ox.tz2" "%BASE_URL%/gclc-v1-fp32-192x192-1x-ox.tz2"
goto NEXT_0051
:SKIP_0051
echo Already exists. Skipping.
:NEXT_0051
echo.

echo [52/325] gclc-v1-fp32-192x192-2x-ov.tz
if exist "%DEST%\gclc-v1-fp32-192x192-2x-ov.tz" goto SKIP_0052
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-192x192-2x-ov.tz" "%BASE_URL%/gclc-v1-fp32-192x192-2x-ov.tz"
goto NEXT_0052
:SKIP_0052
echo Already exists. Skipping.
:NEXT_0052
echo.

echo [53/325] gclc-v1-fp32-192x192-2x-ov.tz2
if exist "%DEST%\gclc-v1-fp32-192x192-2x-ov.tz2" goto SKIP_0053
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-192x192-2x-ov.tz2" "%BASE_URL%/gclc-v1-fp32-192x192-2x-ov.tz2"
goto NEXT_0053
:SKIP_0053
echo Already exists. Skipping.
:NEXT_0053
echo.

echo [54/325] gclc-v1-fp32-192x192-2x-ox.tz2
if exist "%DEST%\gclc-v1-fp32-192x192-2x-ox.tz2" goto SKIP_0054
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-192x192-2x-ox.tz2" "%BASE_URL%/gclc-v1-fp32-192x192-2x-ox.tz2"
goto NEXT_0054
:SKIP_0054
echo Already exists. Skipping.
:NEXT_0054
echo.

echo [55/325] gclc-v1-fp32-192x192-4x-ov.tz
if exist "%DEST%\gclc-v1-fp32-192x192-4x-ov.tz" goto SKIP_0055
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-192x192-4x-ov.tz" "%BASE_URL%/gclc-v1-fp32-192x192-4x-ov.tz"
goto NEXT_0055
:SKIP_0055
echo Already exists. Skipping.
:NEXT_0055
echo.

echo [56/325] gclc-v1-fp32-192x192-4x-ov.tz2
if exist "%DEST%\gclc-v1-fp32-192x192-4x-ov.tz2" goto SKIP_0056
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-192x192-4x-ov.tz2" "%BASE_URL%/gclc-v1-fp32-192x192-4x-ov.tz2"
goto NEXT_0056
:SKIP_0056
echo Already exists. Skipping.
:NEXT_0056
echo.

echo [57/325] gclc-v1-fp32-192x192-4x-ox.tz2
if exist "%DEST%\gclc-v1-fp32-192x192-4x-ox.tz2" goto SKIP_0057
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-192x192-4x-ox.tz2" "%BASE_URL%/gclc-v1-fp32-192x192-4x-ox.tz2"
goto NEXT_0057
:SKIP_0057
echo Already exists. Skipping.
:NEXT_0057
echo.

echo [58/325] gclc-v1-fp32-96x96-2x-ox.tz2
if exist "%DEST%\gclc-v1-fp32-96x96-2x-ox.tz2" goto SKIP_0058
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-96x96-2x-ox.tz2" "%BASE_URL%/gclc-v1-fp32-96x96-2x-ox.tz2"
goto NEXT_0058
:SKIP_0058
echo Already exists. Skipping.
:NEXT_0058
echo.

echo [59/325] gclc-v1-fp32-96x96-4x-ox.tz2
if exist "%DEST%\gclc-v1-fp32-96x96-4x-ox.tz2" goto SKIP_0059
curl -L --fail --retry 3 -o "%DEST%\gclc-v1-fp32-96x96-4x-ox.tz2" "%BASE_URL%/gclc-v1-fp32-96x96-4x-ox.tz2"
goto NEXT_0059
:SKIP_0059
echo Already exists. Skipping.
:NEXT_0059
echo.

echo [60/325] gde-v1-fp32-192x192-1x-ov.tz
if exist "%DEST%\gde-v1-fp32-192x192-1x-ov.tz" goto SKIP_0060
curl -L --fail --retry 3 -o "%DEST%\gde-v1-fp32-192x192-1x-ov.tz" "%BASE_URL%/gde-v1-fp32-192x192-1x-ov.tz"
goto NEXT_0060
:SKIP_0060
echo Already exists. Skipping.
:NEXT_0060
echo.

echo [61/325] gde-v1-fp32-192x192-1x-ov.tz2
if exist "%DEST%\gde-v1-fp32-192x192-1x-ov.tz2" goto SKIP_0061
curl -L --fail --retry 3 -o "%DEST%\gde-v1-fp32-192x192-1x-ov.tz2" "%BASE_URL%/gde-v1-fp32-192x192-1x-ov.tz2"
goto NEXT_0061
:SKIP_0061
echo Already exists. Skipping.
:NEXT_0061
echo.

echo [62/325] gde-v1-fp32-192x192-2x-ov.tz
if exist "%DEST%\gde-v1-fp32-192x192-2x-ov.tz" goto SKIP_0062
curl -L --fail --retry 3 -o "%DEST%\gde-v1-fp32-192x192-2x-ov.tz" "%BASE_URL%/gde-v1-fp32-192x192-2x-ov.tz"
goto NEXT_0062
:SKIP_0062
echo Already exists. Skipping.
:NEXT_0062
echo.

echo [63/325] gde-v1-fp32-192x192-2x-ov.tz2
if exist "%DEST%\gde-v1-fp32-192x192-2x-ov.tz2" goto SKIP_0063
curl -L --fail --retry 3 -o "%DEST%\gde-v1-fp32-192x192-2x-ov.tz2" "%BASE_URL%/gde-v1-fp32-192x192-2x-ov.tz2"
goto NEXT_0063
:SKIP_0063
echo Already exists. Skipping.
:NEXT_0063
echo.

echo [64/325] gde-v1-fp32-192x192-4x-ov.tz
if exist "%DEST%\gde-v1-fp32-192x192-4x-ov.tz" goto SKIP_0064
curl -L --fail --retry 3 -o "%DEST%\gde-v1-fp32-192x192-4x-ov.tz" "%BASE_URL%/gde-v1-fp32-192x192-4x-ov.tz"
goto NEXT_0064
:SKIP_0064
echo Already exists. Skipping.
:NEXT_0064
echo.

echo [65/325] gde-v1-fp32-192x192-4x-ov.tz2
if exist "%DEST%\gde-v1-fp32-192x192-4x-ov.tz2" goto SKIP_0065
curl -L --fail --retry 3 -o "%DEST%\gde-v1-fp32-192x192-4x-ov.tz2" "%BASE_URL%/gde-v1-fp32-192x192-4x-ov.tz2"
goto NEXT_0065
:SKIP_0065
echo Already exists. Skipping.
:NEXT_0065
echo.

echo [66/325] gde-v2-fp32-192x192-1x-ox.tz2
if exist "%DEST%\gde-v2-fp32-192x192-1x-ox.tz2" goto SKIP_0066
curl -L --fail --retry 3 -o "%DEST%\gde-v2-fp32-192x192-1x-ox.tz2" "%BASE_URL%/gde-v2-fp32-192x192-1x-ox.tz2"
goto NEXT_0066
:SKIP_0066
echo Already exists. Skipping.
:NEXT_0066
echo.

echo [67/325] gde-v2-fp32-192x192-2x-ox.tz2
if exist "%DEST%\gde-v2-fp32-192x192-2x-ox.tz2" goto SKIP_0067
curl -L --fail --retry 3 -o "%DEST%\gde-v2-fp32-192x192-2x-ox.tz2" "%BASE_URL%/gde-v2-fp32-192x192-2x-ox.tz2"
goto NEXT_0067
:SKIP_0067
echo Already exists. Skipping.
:NEXT_0067
echo.

echo [68/325] gde-v2-fp32-192x192-4x-ox.tz2
if exist "%DEST%\gde-v2-fp32-192x192-4x-ox.tz2" goto SKIP_0068
curl -L --fail --retry 3 -o "%DEST%\gde-v2-fp32-192x192-4x-ox.tz2" "%BASE_URL%/gde-v2-fp32-192x192-4x-ox.tz2"
goto NEXT_0068
:SKIP_0068
echo Already exists. Skipping.
:NEXT_0068
echo.

echo [69/325] gde_ap-v1-fp16-64x64-rev2-ox.tz2
if exist "%DEST%\gde_ap-v1-fp16-64x64-rev2-ox.tz2" goto SKIP_0069
curl -L --fail --retry 3 -o "%DEST%\gde_ap-v1-fp16-64x64-rev2-ox.tz2" "%BASE_URL%/gde_ap-v1-fp16-64x64-rev2-ox.tz2"
goto NEXT_0069
:SKIP_0069
echo Already exists. Skipping.
:NEXT_0069
echo.

echo [70/325] gde_ap-v1-fp32-64x64-ov.tz
if exist "%DEST%\gde_ap-v1-fp32-64x64-ov.tz" goto SKIP_0070
curl -L --fail --retry 3 -o "%DEST%\gde_ap-v1-fp32-64x64-ov.tz" "%BASE_URL%/gde_ap-v1-fp32-64x64-ov.tz"
goto NEXT_0070
:SKIP_0070
echo Already exists. Skipping.
:NEXT_0070
echo.

echo [71/325] gendet-v1-fp32-256x256-1x-ov.tz
if exist "%DEST%\gendet-v1-fp32-256x256-1x-ov.tz" goto SKIP_0071
curl -L --fail --retry 3 -o "%DEST%\gendet-v1-fp32-256x256-1x-ov.tz" "%BASE_URL%/gendet-v1-fp32-256x256-1x-ov.tz"
goto NEXT_0071
:SKIP_0071
echo Already exists. Skipping.
:NEXT_0071
echo.

echo [72/325] gendet-v1-fp32-256x256-1x-ox.tz
if exist "%DEST%\gendet-v1-fp32-256x256-1x-ox.tz" goto SKIP_0072
curl -L --fail --retry 3 -o "%DEST%\gendet-v1-fp32-256x256-1x-ox.tz" "%BASE_URL%/gendet-v1-fp32-256x256-1x-ox.tz"
goto NEXT_0072
:SKIP_0072
echo Already exists. Skipping.
:NEXT_0072
echo.

echo [73/325] gfclc-v1-fp32-512x512-ov-11.tz
if exist "%DEST%\gfclc-v1-fp32-512x512-ov-11.tz" goto SKIP_0073
curl -L --fail --retry 3 -o "%DEST%\gfclc-v1-fp32-512x512-ov-11.tz" "%BASE_URL%/gfclc-v1-fp32-512x512-ov-11.tz"
goto NEXT_0073
:SKIP_0073
echo Already exists. Skipping.
:NEXT_0073
echo.

echo [74/325] gfclc-v1-fp32-512x512-ov-11.tz2
if exist "%DEST%\gfclc-v1-fp32-512x512-ov-11.tz2" goto SKIP_0074
curl -L --fail --retry 3 -o "%DEST%\gfclc-v1-fp32-512x512-ov-11.tz2" "%BASE_URL%/gfclc-v1-fp32-512x512-ov-11.tz2"
goto NEXT_0074
:SKIP_0074
echo Already exists. Skipping.
:NEXT_0074
echo.

echo [75/325] gffm-v1-fp32-512x512-ov.tz2
if exist "%DEST%\gffm-v1-fp32-512x512-ov.tz2" goto SKIP_0075
curl -L --fail --retry 3 -o "%DEST%\gffm-v1-fp32-512x512-ov.tz2" "%BASE_URL%/gffm-v1-fp32-512x512-ov.tz2"
goto NEXT_0075
:SKIP_0075
echo Already exists. Skipping.
:NEXT_0075
echo.

echo [76/325] gffm-v1-fp32-512x512-ox.tz2
if exist "%DEST%\gffm-v1-fp32-512x512-ox.tz2" goto SKIP_0076
curl -L --fail --retry 3 -o "%DEST%\gffm-v1-fp32-512x512-ox.tz2" "%BASE_URL%/gffm-v1-fp32-512x512-ox.tz2"
goto NEXT_0076
:SKIP_0076
echo Already exists. Skipping.
:NEXT_0076
echo.

echo [77/325] gfg-v1-fp16-512x512-ov.tz2
if exist "%DEST%\gfg-v1-fp16-512x512-ov.tz2" goto SKIP_0077
curl -L --fail --retry 3 -o "%DEST%\gfg-v1-fp16-512x512-ov.tz2" "%BASE_URL%/gfg-v1-fp16-512x512-ov.tz2"
goto NEXT_0077
:SKIP_0077
echo Already exists. Skipping.
:NEXT_0077
echo.

echo [78/325] gfg-v1-fp32-512x512-ox.tz2
if exist "%DEST%\gfg-v1-fp32-512x512-ox.tz2" goto SKIP_0078
curl -L --fail --retry 3 -o "%DEST%\gfg-v1-fp32-512x512-ox.tz2" "%BASE_URL%/gfg-v1-fp32-512x512-ox.tz2"
goto NEXT_0078
:SKIP_0078
echo Already exists. Skipping.
:NEXT_0078
echo.

echo [79/325] gfp-l-v1-fp32-2048x2048-ov.tz2
if exist "%DEST%\gfp-l-v1-fp32-2048x2048-ov.tz2" goto SKIP_0079
curl -L --fail --retry 3 -o "%DEST%\gfp-l-v1-fp32-2048x2048-ov.tz2" "%BASE_URL%/gfp-l-v1-fp32-2048x2048-ov.tz2"
goto NEXT_0079
:SKIP_0079
echo Already exists. Skipping.
:NEXT_0079
echo.

echo [80/325] gfp-l-v1-fp32-2048x2048-ox.tz2
if exist "%DEST%\gfp-l-v1-fp32-2048x2048-ox.tz2" goto SKIP_0080
curl -L --fail --retry 3 -o "%DEST%\gfp-l-v1-fp32-2048x2048-ox.tz2" "%BASE_URL%/gfp-l-v1-fp32-2048x2048-ox.tz2"
goto NEXT_0080
:SKIP_0080
echo Already exists. Skipping.
:NEXT_0080
echo.

echo [81/325] gfp-s-v1-fp32-1024x1024-ov.tz2
if exist "%DEST%\gfp-s-v1-fp32-1024x1024-ov.tz2" goto SKIP_0081
curl -L --fail --retry 3 -o "%DEST%\gfp-s-v1-fp32-1024x1024-ov.tz2" "%BASE_URL%/gfp-s-v1-fp32-1024x1024-ov.tz2"
goto NEXT_0081
:SKIP_0081
echo Already exists. Skipping.
:NEXT_0081
echo.

echo [82/325] gfp-s-v1-fp32-1024x1024-ox.tz2
if exist "%DEST%\gfp-s-v1-fp32-1024x1024-ox.tz2" goto SKIP_0082
curl -L --fail --retry 3 -o "%DEST%\gfp-s-v1-fp32-1024x1024-ox.tz2" "%BASE_URL%/gfp-s-v1-fp32-1024x1024-ox.tz2"
goto NEXT_0082
:SKIP_0082
echo Already exists. Skipping.
:NEXT_0082
echo.

echo [83/325] gfpf-v1-fp16-48x48-ov.tz2
if exist "%DEST%\gfpf-v1-fp16-48x48-ov.tz2" goto SKIP_0083
curl -L --fail --retry 3 -o "%DEST%\gfpf-v1-fp16-48x48-ov.tz2" "%BASE_URL%/gfpf-v1-fp16-48x48-ov.tz2"
goto NEXT_0083
:SKIP_0083
echo Already exists. Skipping.
:NEXT_0083
echo.

echo [84/325] gfpf-v1-fp32-48x48-ox.tz2
if exist "%DEST%\gfpf-v1-fp32-48x48-ox.tz2" goto SKIP_0084
curl -L --fail --retry 3 -o "%DEST%\gfpf-v1-fp32-48x48-ox.tz2" "%BASE_URL%/gfpf-v1-fp32-48x48-ox.tz2"
goto NEXT_0084
:SKIP_0084
echo Already exists. Skipping.
:NEXT_0084
echo.

echo [85/325] gfrf-v2-fp16-1024x1024-ov.tz
if exist "%DEST%\gfrf-v2-fp16-1024x1024-ov.tz" goto SKIP_0085
curl -L --fail --retry 3 -o "%DEST%\gfrf-v2-fp16-1024x1024-ov.tz" "%BASE_URL%/gfrf-v2-fp16-1024x1024-ov.tz"
goto NEXT_0085
:SKIP_0085
echo Already exists. Skipping.
:NEXT_0085
echo.

echo [86/325] gfrf-v2-fp16-1024x1024-ov.tz2
if exist "%DEST%\gfrf-v2-fp16-1024x1024-ov.tz2" goto SKIP_0086
curl -L --fail --retry 3 -o "%DEST%\gfrf-v2-fp16-1024x1024-ov.tz2" "%BASE_URL%/gfrf-v2-fp16-1024x1024-ov.tz2"
goto NEXT_0086
:SKIP_0086
echo Already exists. Skipping.
:NEXT_0086
echo.

echo [87/325] gfrf-v2-fp32-1024x1024-ox.tz
if exist "%DEST%\gfrf-v2-fp32-1024x1024-ox.tz" goto SKIP_0087
curl -L --fail --retry 3 -o "%DEST%\gfrf-v2-fp32-1024x1024-ox.tz" "%BASE_URL%/gfrf-v2-fp32-1024x1024-ox.tz"
goto NEXT_0087
:SKIP_0087
echo Already exists. Skipping.
:NEXT_0087
echo.

echo [88/325] gfrf-v2-fp32-1024x1024-ox.tz2
if exist "%DEST%\gfrf-v2-fp32-1024x1024-ox.tz2" goto SKIP_0088
curl -L --fail --retry 3 -o "%DEST%\gfrf-v2-fp32-1024x1024-ox.tz2" "%BASE_URL%/gfrf-v2-fp32-1024x1024-ox.tz2"
goto NEXT_0088
:SKIP_0088
echo Already exists. Skipping.
:NEXT_0088
echo.

echo [89/325] gfrfn-v3-fp32-1024x1024-ox.tz2
if exist "%DEST%\gfrfn-v3-fp32-1024x1024-ox.tz2" goto SKIP_0089
curl -L --fail --retry 3 -o "%DEST%\gfrfn-v3-fp32-1024x1024-ox.tz2" "%BASE_URL%/gfrfn-v3-fp32-1024x1024-ox.tz2"
goto NEXT_0089
:SKIP_0089
echo Already exists. Skipping.
:NEXT_0089
echo.

echo [90/325] gfrg-v3-fp16-512x512-ov.tz
if exist "%DEST%\gfrg-v3-fp16-512x512-ov.tz" goto SKIP_0090
curl -L --fail --retry 3 -o "%DEST%\gfrg-v3-fp16-512x512-ov.tz" "%BASE_URL%/gfrg-v3-fp16-512x512-ov.tz"
goto NEXT_0090
:SKIP_0090
echo Already exists. Skipping.
:NEXT_0090
echo.

echo [91/325] gfrg-v3-fp16-512x512-ov.tz2
if exist "%DEST%\gfrg-v3-fp16-512x512-ov.tz2" goto SKIP_0091
curl -L --fail --retry 3 -o "%DEST%\gfrg-v3-fp16-512x512-ov.tz2" "%BASE_URL%/gfrg-v3-fp16-512x512-ov.tz2"
goto NEXT_0091
:SKIP_0091
echo Already exists. Skipping.
:NEXT_0091
echo.

echo [92/325] gfrg-v3-fp32-512x512-ox.tz
if exist "%DEST%\gfrg-v3-fp32-512x512-ox.tz" goto SKIP_0092
curl -L --fail --retry 3 -o "%DEST%\gfrg-v3-fp32-512x512-ox.tz" "%BASE_URL%/gfrg-v3-fp32-512x512-ox.tz"
goto NEXT_0092
:SKIP_0092
echo Already exists. Skipping.
:NEXT_0092
echo.

echo [93/325] gfrg-v3-fp32-512x512-ox.tz2
if exist "%DEST%\gfrg-v3-fp32-512x512-ox.tz2" goto SKIP_0093
curl -L --fail --retry 3 -o "%DEST%\gfrg-v3-fp32-512x512-ox.tz2" "%BASE_URL%/gfrg-v3-fp32-512x512-ox.tz2"
goto NEXT_0093
:SKIP_0093
echo Already exists. Skipping.
:NEXT_0093
echo.

echo [94/325] ggi-v1-fp32-192x192-2x-ov.tz2
if exist "%DEST%\ggi-v1-fp32-192x192-2x-ov.tz2" goto SKIP_0094
curl -L --fail --retry 3 -o "%DEST%\ggi-v1-fp32-192x192-2x-ov.tz2" "%BASE_URL%/ggi-v1-fp32-192x192-2x-ov.tz2"
goto NEXT_0094
:SKIP_0094
echo Already exists. Skipping.
:NEXT_0094
echo.

echo [95/325] ggi-v1-fp32-192x192-4x-ov.tz2
if exist "%DEST%\ggi-v1-fp32-192x192-4x-ov.tz2" goto SKIP_0095
curl -L --fail --retry 3 -o "%DEST%\ggi-v1-fp32-192x192-4x-ov.tz2" "%BASE_URL%/ggi-v1-fp32-192x192-4x-ov.tz2"
goto NEXT_0095
:SKIP_0095
echo Already exists. Skipping.
:NEXT_0095
echo.

echo [96/325] ggi-v2-fp32-192x192-2x-ox.tz2
if exist "%DEST%\ggi-v2-fp32-192x192-2x-ox.tz2" goto SKIP_0096
curl -L --fail --retry 3 -o "%DEST%\ggi-v2-fp32-192x192-2x-ox.tz2" "%BASE_URL%/ggi-v2-fp32-192x192-2x-ox.tz2"
goto NEXT_0096
:SKIP_0096
echo Already exists. Skipping.
:NEXT_0096
echo.

echo [97/325] ggi-v2-fp32-192x192-4x-ox.tz2
if exist "%DEST%\ggi-v2-fp32-192x192-4x-ox.tz2" goto SKIP_0097
curl -L --fail --retry 3 -o "%DEST%\ggi-v2-fp32-192x192-4x-ox.tz2" "%BASE_URL%/ggi-v2-fp32-192x192-4x-ox.tz2"
goto NEXT_0097
:SKIP_0097
echo Already exists. Skipping.
:NEXT_0097
echo.

echo [98/325] ggn-v3-fix-fp16-128x128-2x-ox.tz2
if exist "%DEST%\ggn-v3-fix-fp16-128x128-2x-ox.tz2" goto SKIP_0098
curl -L --fail --retry 3 -o "%DEST%\ggn-v3-fix-fp16-128x128-2x-ox.tz2" "%BASE_URL%/ggn-v3-fix-fp16-128x128-2x-ox.tz2"
goto NEXT_0098
:SKIP_0098
echo Already exists. Skipping.
:NEXT_0098
echo.

echo [99/325] ggn-v3-fp16-128x128-2x-ov.tz2
if exist "%DEST%\ggn-v3-fp16-128x128-2x-ov.tz2" goto SKIP_0099
curl -L --fail --retry 3 -o "%DEST%\ggn-v3-fp16-128x128-2x-ov.tz2" "%BASE_URL%/ggn-v3-fp16-128x128-2x-ov.tz2"
goto NEXT_0099
:SKIP_0099
echo Already exists. Skipping.
:NEXT_0099
echo.

echo [100/325] ggn-v3-fp16-128x128-4x-ov.tz2
if exist "%DEST%\ggn-v3-fp16-128x128-4x-ov.tz2" goto SKIP_0100
curl -L --fail --retry 3 -o "%DEST%\ggn-v3-fp16-128x128-4x-ov.tz2" "%BASE_URL%/ggn-v3-fp16-128x128-4x-ov.tz2"
goto NEXT_0100
:SKIP_0100
echo Already exists. Skipping.
:NEXT_0100
echo.

echo [101/325] ggn-v3-fp16-128x128-4x-ox.tz2
if exist "%DEST%\ggn-v3-fp16-128x128-4x-ox.tz2" goto SKIP_0101
curl -L --fail --retry 3 -o "%DEST%\ggn-v3-fp16-128x128-4x-ox.tz2" "%BASE_URL%/ggn-v3-fp16-128x128-4x-ox.tz2"
goto NEXT_0101
:SKIP_0101
echo Already exists. Skipping.
:NEXT_0101
echo.

echo [102/325] ggn-v3-fp32-128x128-2x-ox.tz2
if exist "%DEST%\ggn-v3-fp32-128x128-2x-ox.tz2" goto SKIP_0102
curl -L --fail --retry 3 -o "%DEST%\ggn-v3-fp32-128x128-2x-ox.tz2" "%BASE_URL%/ggn-v3-fp32-128x128-2x-ox.tz2"
goto NEXT_0102
:SKIP_0102
echo Already exists. Skipping.
:NEXT_0102
echo.

echo [103/325] ggn-v3-fp32-128x128-4x-ox.tz2
if exist "%DEST%\ggn-v3-fp32-128x128-4x-ox.tz2" goto SKIP_0103
curl -L --fail --retry 3 -o "%DEST%\ggn-v3-fp32-128x128-4x-ox.tz2" "%BASE_URL%/ggn-v3-fp32-128x128-4x-ox.tz2"
goto NEXT_0103
:SKIP_0103
echo Already exists. Skipping.
:NEXT_0103
echo.

echo [104/325] ggn_ap-v2-fp16-128x128-ov.tz2
if exist "%DEST%\ggn_ap-v2-fp16-128x128-ov.tz2" goto SKIP_0104
curl -L --fail --retry 3 -o "%DEST%\ggn_ap-v2-fp16-128x128-ov.tz2" "%BASE_URL%/ggn_ap-v2-fp16-128x128-ov.tz2"
goto NEXT_0104
:SKIP_0104
echo Already exists. Skipping.
:NEXT_0104
echo.

echo [105/325] ggn_ap-v2-fp16-128x128-ox.tz2
if exist "%DEST%\ggn_ap-v2-fp16-128x128-ox.tz2" goto SKIP_0105
curl -L --fail --retry 3 -o "%DEST%\ggn_ap-v2-fp16-128x128-ox.tz2" "%BASE_URL%/ggn_ap-v2-fp16-128x128-ox.tz2"
goto NEXT_0105
:SKIP_0105
echo Already exists. Skipping.
:NEXT_0105
echo.

echo [106/325] ggn_ap-v2-fp16-128x128-rev2-ox.tz2
if exist "%DEST%\ggn_ap-v2-fp16-128x128-rev2-ox.tz2" goto SKIP_0106
curl -L --fail --retry 3 -o "%DEST%\ggn_ap-v2-fp16-128x128-rev2-ox.tz2" "%BASE_URL%/ggn_ap-v2-fp16-128x128-rev2-ox.tz2"
goto NEXT_0106
:SKIP_0106
echo Already exists. Skipping.
:NEXT_0106
echo.

echo [107/325] ggn_ap-v2-fp16-512x512-rev2-ox.tz2
if exist "%DEST%\ggn_ap-v2-fp16-512x512-rev2-ox.tz2" goto SKIP_0107
curl -L --fail --retry 3 -o "%DEST%\ggn_ap-v2-fp16-512x512-rev2-ox.tz2" "%BASE_URL%/ggn_ap-v2-fp16-512x512-rev2-ox.tz2"
goto NEXT_0107
:SKIP_0107
echo Already exists. Skipping.
:NEXT_0107
echo.

echo [108/325] ggnv2-v3-fp16-128x128-2x-ov.tz
if exist "%DEST%\ggnv2-v3-fp16-128x128-2x-ov.tz" goto SKIP_0108
curl -L --fail --retry 3 -o "%DEST%\ggnv2-v3-fp16-128x128-2x-ov.tz" "%BASE_URL%/ggnv2-v3-fp16-128x128-2x-ov.tz"
goto NEXT_0108
:SKIP_0108
echo Already exists. Skipping.
:NEXT_0108
echo.

echo [109/325] ggnv2-v3-fp16-128x128-2x-ox.tz
if exist "%DEST%\ggnv2-v3-fp16-128x128-2x-ox.tz" goto SKIP_0109
curl -L --fail --retry 3 -o "%DEST%\ggnv2-v3-fp16-128x128-2x-ox.tz" "%BASE_URL%/ggnv2-v3-fp16-128x128-2x-ox.tz"
goto NEXT_0109
:SKIP_0109
echo Already exists. Skipping.
:NEXT_0109
echo.

echo [110/325] ggnv2-v3-fp16-128x128-2x-rev2-ov.tz2
if exist "%DEST%\ggnv2-v3-fp16-128x128-2x-rev2-ov.tz2" goto SKIP_0110
curl -L --fail --retry 3 -o "%DEST%\ggnv2-v3-fp16-128x128-2x-rev2-ov.tz2" "%BASE_URL%/ggnv2-v3-fp16-128x128-2x-rev2-ov.tz2"
goto NEXT_0110
:SKIP_0110
echo Already exists. Skipping.
:NEXT_0110
echo.

echo [111/325] ggnv2-v3-fp16-128x128-4x-ov.tz
if exist "%DEST%\ggnv2-v3-fp16-128x128-4x-ov.tz" goto SKIP_0111
curl -L --fail --retry 3 -o "%DEST%\ggnv2-v3-fp16-128x128-4x-ov.tz" "%BASE_URL%/ggnv2-v3-fp16-128x128-4x-ov.tz"
goto NEXT_0111
:SKIP_0111
echo Already exists. Skipping.
:NEXT_0111
echo.

echo [112/325] ggnv2-v3-fp16-128x128-4x-ox.tz
if exist "%DEST%\ggnv2-v3-fp16-128x128-4x-ox.tz" goto SKIP_0112
curl -L --fail --retry 3 -o "%DEST%\ggnv2-v3-fp16-128x128-4x-ox.tz" "%BASE_URL%/ggnv2-v3-fp16-128x128-4x-ox.tz"
goto NEXT_0112
:SKIP_0112
echo Already exists. Skipping.
:NEXT_0112
echo.

echo [113/325] ggnv2-v3-fp16-128x128-4x-rev2-ov.tz2
if exist "%DEST%\ggnv2-v3-fp16-128x128-4x-rev2-ov.tz2" goto SKIP_0113
curl -L --fail --retry 3 -o "%DEST%\ggnv2-v3-fp16-128x128-4x-rev2-ov.tz2" "%BASE_URL%/ggnv2-v3-fp16-128x128-4x-rev2-ov.tz2"
goto NEXT_0113
:SKIP_0113
echo Already exists. Skipping.
:NEXT_0113
echo.

echo [114/325] ggnv2-v3-fp32-128x128-2x-ox.tz2
if exist "%DEST%\ggnv2-v3-fp32-128x128-2x-ox.tz2" goto SKIP_0114
curl -L --fail --retry 3 -o "%DEST%\ggnv2-v3-fp32-128x128-2x-ox.tz2" "%BASE_URL%/ggnv2-v3-fp32-128x128-2x-ox.tz2"
goto NEXT_0114
:SKIP_0114
echo Already exists. Skipping.
:NEXT_0114
echo.

echo [115/325] ggnv2-v3-fp32-128x128-4x-ox.tz2
if exist "%DEST%\ggnv2-v3-fp32-128x128-4x-ox.tz2" goto SKIP_0115
curl -L --fail --retry 3 -o "%DEST%\ggnv2-v3-fp32-128x128-4x-ox.tz2" "%BASE_URL%/ggnv2-v3-fp32-128x128-4x-ox.tz2"
goto NEXT_0115
:SKIP_0115
echo Already exists. Skipping.
:NEXT_0115
echo.

echo [116/325] ghc-v2-fp32-192x192-1x-ov.tz
if exist "%DEST%\ghc-v2-fp32-192x192-1x-ov.tz" goto SKIP_0116
curl -L --fail --retry 3 -o "%DEST%\ghc-v2-fp32-192x192-1x-ov.tz" "%BASE_URL%/ghc-v2-fp32-192x192-1x-ov.tz"
goto NEXT_0116
:SKIP_0116
echo Already exists. Skipping.
:NEXT_0116
echo.

echo [117/325] ghc-v2-fp32-192x192-1x-ov.tz2
if exist "%DEST%\ghc-v2-fp32-192x192-1x-ov.tz2" goto SKIP_0117
curl -L --fail --retry 3 -o "%DEST%\ghc-v2-fp32-192x192-1x-ov.tz2" "%BASE_URL%/ghc-v2-fp32-192x192-1x-ov.tz2"
goto NEXT_0117
:SKIP_0117
echo Already exists. Skipping.
:NEXT_0117
echo.

echo [118/325] ghc-v2-fp32-192x192-1x-ox.tz2
if exist "%DEST%\ghc-v2-fp32-192x192-1x-ox.tz2" goto SKIP_0118
curl -L --fail --retry 3 -o "%DEST%\ghc-v2-fp32-192x192-1x-ox.tz2" "%BASE_URL%/ghc-v2-fp32-192x192-1x-ox.tz2"
goto NEXT_0118
:SKIP_0118
echo Already exists. Skipping.
:NEXT_0118
echo.

echo [119/325] ghc-v2-fp32-192x192-2x-ov.tz
if exist "%DEST%\ghc-v2-fp32-192x192-2x-ov.tz" goto SKIP_0119
curl -L --fail --retry 3 -o "%DEST%\ghc-v2-fp32-192x192-2x-ov.tz" "%BASE_URL%/ghc-v2-fp32-192x192-2x-ov.tz"
goto NEXT_0119
:SKIP_0119
echo Already exists. Skipping.
:NEXT_0119
echo.

echo [120/325] ghc-v2-fp32-192x192-2x-ov.tz2
if exist "%DEST%\ghc-v2-fp32-192x192-2x-ov.tz2" goto SKIP_0120
curl -L --fail --retry 3 -o "%DEST%\ghc-v2-fp32-192x192-2x-ov.tz2" "%BASE_URL%/ghc-v2-fp32-192x192-2x-ov.tz2"
goto NEXT_0120
:SKIP_0120
echo Already exists. Skipping.
:NEXT_0120
echo.

echo [121/325] ghc-v2-fp32-192x192-2x-ox.tz2
if exist "%DEST%\ghc-v2-fp32-192x192-2x-ox.tz2" goto SKIP_0121
curl -L --fail --retry 3 -o "%DEST%\ghc-v2-fp32-192x192-2x-ox.tz2" "%BASE_URL%/ghc-v2-fp32-192x192-2x-ox.tz2"
goto NEXT_0121
:SKIP_0121
echo Already exists. Skipping.
:NEXT_0121
echo.

echo [122/325] ghc-v2-fp32-192x192-4x-ov.tz
if exist "%DEST%\ghc-v2-fp32-192x192-4x-ov.tz" goto SKIP_0122
curl -L --fail --retry 3 -o "%DEST%\ghc-v2-fp32-192x192-4x-ov.tz" "%BASE_URL%/ghc-v2-fp32-192x192-4x-ov.tz"
goto NEXT_0122
:SKIP_0122
echo Already exists. Skipping.
:NEXT_0122
echo.

echo [123/325] ghc-v2-fp32-192x192-4x-ov.tz2
if exist "%DEST%\ghc-v2-fp32-192x192-4x-ov.tz2" goto SKIP_0123
curl -L --fail --retry 3 -o "%DEST%\ghc-v2-fp32-192x192-4x-ov.tz2" "%BASE_URL%/ghc-v2-fp32-192x192-4x-ov.tz2"
goto NEXT_0123
:SKIP_0123
echo Already exists. Skipping.
:NEXT_0123
echo.

echo [124/325] ghc-v2-fp32-192x192-4x-ox.tz2
if exist "%DEST%\ghc-v2-fp32-192x192-4x-ox.tz2" goto SKIP_0124
curl -L --fail --retry 3 -o "%DEST%\ghc-v2-fp32-192x192-4x-ox.tz2" "%BASE_URL%/ghc-v2-fp32-192x192-4x-ox.tz2"
goto NEXT_0124
:SKIP_0124
echo Already exists. Skipping.
:NEXT_0124
echo.

echo [125/325] ghq-v1-fix-fp16-96x96-2x-ox.tz2
if exist "%DEST%\ghq-v1-fix-fp16-96x96-2x-ox.tz2" goto SKIP_0125
curl -L --fail --retry 3 -o "%DEST%\ghq-v1-fix-fp16-96x96-2x-ox.tz2" "%BASE_URL%/ghq-v1-fix-fp16-96x96-2x-ox.tz2"
goto NEXT_0125
:SKIP_0125
echo Already exists. Skipping.
:NEXT_0125
echo.

echo [126/325] ghq-v1-fp16-96x96-2x-ov.tz2
if exist "%DEST%\ghq-v1-fp16-96x96-2x-ov.tz2" goto SKIP_0126
curl -L --fail --retry 3 -o "%DEST%\ghq-v1-fp16-96x96-2x-ov.tz2" "%BASE_URL%/ghq-v1-fp16-96x96-2x-ov.tz2"
goto NEXT_0126
:SKIP_0126
echo Already exists. Skipping.
:NEXT_0126
echo.

echo [127/325] ghq-v1-fp16-96x96-4x-ov.tz2
if exist "%DEST%\ghq-v1-fp16-96x96-4x-ov.tz2" goto SKIP_0127
curl -L --fail --retry 3 -o "%DEST%\ghq-v1-fp16-96x96-4x-ov.tz2" "%BASE_URL%/ghq-v1-fp16-96x96-4x-ov.tz2"
goto NEXT_0127
:SKIP_0127
echo Already exists. Skipping.
:NEXT_0127
echo.

echo [128/325] ghq-v1-fp16-96x96-4x-ox.tz2
if exist "%DEST%\ghq-v1-fp16-96x96-4x-ox.tz2" goto SKIP_0128
curl -L --fail --retry 3 -o "%DEST%\ghq-v1-fp16-96x96-4x-ox.tz2" "%BASE_URL%/ghq-v1-fp16-96x96-4x-ox.tz2"
goto NEXT_0128
:SKIP_0128
echo Already exists. Skipping.
:NEXT_0128
echo.

echo [129/325] ghq-v1-fp32-96x96-2x-ox.tz2
if exist "%DEST%\ghq-v1-fp32-96x96-2x-ox.tz2" goto SKIP_0129
curl -L --fail --retry 3 -o "%DEST%\ghq-v1-fp32-96x96-2x-ox.tz2" "%BASE_URL%/ghq-v1-fp32-96x96-2x-ox.tz2"
goto NEXT_0129
:SKIP_0129
echo Already exists. Skipping.
:NEXT_0129
echo.

echo [130/325] ghq-v1-fp32-96x96-4x-ox.tz2
if exist "%DEST%\ghq-v1-fp32-96x96-4x-ox.tz2" goto SKIP_0130
curl -L --fail --retry 3 -o "%DEST%\ghq-v1-fp32-96x96-4x-ox.tz2" "%BASE_URL%/ghq-v1-fp32-96x96-4x-ox.tz2"
goto NEXT_0130
:SKIP_0130
echo Already exists. Skipping.
:NEXT_0130
echo.

echo [131/325] ghqv2-v1-fp16-128x128-2x-ov.tz
if exist "%DEST%\ghqv2-v1-fp16-128x128-2x-ov.tz" goto SKIP_0131
curl -L --fail --retry 3 -o "%DEST%\ghqv2-v1-fp16-128x128-2x-ov.tz" "%BASE_URL%/ghqv2-v1-fp16-128x128-2x-ov.tz"
goto NEXT_0131
:SKIP_0131
echo Already exists. Skipping.
:NEXT_0131
echo.

echo [132/325] ghqv2-v1-fp16-128x128-2x-ox.tz
if exist "%DEST%\ghqv2-v1-fp16-128x128-2x-ox.tz" goto SKIP_0132
curl -L --fail --retry 3 -o "%DEST%\ghqv2-v1-fp16-128x128-2x-ox.tz" "%BASE_URL%/ghqv2-v1-fp16-128x128-2x-ox.tz"
goto NEXT_0132
:SKIP_0132
echo Already exists. Skipping.
:NEXT_0132
echo.

echo [133/325] ghqv2-v1-fp16-128x128-2x-rev2-ov.tz2
if exist "%DEST%\ghqv2-v1-fp16-128x128-2x-rev2-ov.tz2" goto SKIP_0133
curl -L --fail --retry 3 -o "%DEST%\ghqv2-v1-fp16-128x128-2x-rev2-ov.tz2" "%BASE_URL%/ghqv2-v1-fp16-128x128-2x-rev2-ov.tz2"
goto NEXT_0133
:SKIP_0133
echo Already exists. Skipping.
:NEXT_0133
echo.

echo [134/325] ghqv2-v1-fp16-128x128-4x-ov.tz
if exist "%DEST%\ghqv2-v1-fp16-128x128-4x-ov.tz" goto SKIP_0134
curl -L --fail --retry 3 -o "%DEST%\ghqv2-v1-fp16-128x128-4x-ov.tz" "%BASE_URL%/ghqv2-v1-fp16-128x128-4x-ov.tz"
goto NEXT_0134
:SKIP_0134
echo Already exists. Skipping.
:NEXT_0134
echo.

echo [135/325] ghqv2-v1-fp16-128x128-4x-ox.tz
if exist "%DEST%\ghqv2-v1-fp16-128x128-4x-ox.tz" goto SKIP_0135
curl -L --fail --retry 3 -o "%DEST%\ghqv2-v1-fp16-128x128-4x-ox.tz" "%BASE_URL%/ghqv2-v1-fp16-128x128-4x-ox.tz"
goto NEXT_0135
:SKIP_0135
echo Already exists. Skipping.
:NEXT_0135
echo.

echo [136/325] ghqv2-v1-fp16-128x128-4x-rev2-ov.tz2
if exist "%DEST%\ghqv2-v1-fp16-128x128-4x-rev2-ov.tz2" goto SKIP_0136
curl -L --fail --retry 3 -o "%DEST%\ghqv2-v1-fp16-128x128-4x-rev2-ov.tz2" "%BASE_URL%/ghqv2-v1-fp16-128x128-4x-rev2-ov.tz2"
goto NEXT_0136
:SKIP_0136
echo Already exists. Skipping.
:NEXT_0136
echo.

echo [137/325] ghqv2-v1-fp32-128x128-2x-ox.tz2
if exist "%DEST%\ghqv2-v1-fp32-128x128-2x-ox.tz2" goto SKIP_0137
curl -L --fail --retry 3 -o "%DEST%\ghqv2-v1-fp32-128x128-2x-ox.tz2" "%BASE_URL%/ghqv2-v1-fp32-128x128-2x-ox.tz2"
goto NEXT_0137
:SKIP_0137
echo Already exists. Skipping.
:NEXT_0137
echo.

echo [138/325] ghqv2-v1-fp32-128x128-4x-ox.tz2
if exist "%DEST%\ghqv2-v1-fp32-128x128-4x-ox.tz2" goto SKIP_0138
curl -L --fail --retry 3 -o "%DEST%\ghqv2-v1-fp32-128x128-4x-ox.tz2" "%BASE_URL%/ghqv2-v1-fp32-128x128-4x-ox.tz2"
goto NEXT_0138
:SKIP_0138
echo Already exists. Skipping.
:NEXT_0138
echo.

echo [139/325] ghqv2_ldn-v1-fp16-128x128-2x-ov.tz
if exist "%DEST%\ghqv2_ldn-v1-fp16-128x128-2x-ov.tz" goto SKIP_0139
curl -L --fail --retry 3 -o "%DEST%\ghqv2_ldn-v1-fp16-128x128-2x-ov.tz" "%BASE_URL%/ghqv2_ldn-v1-fp16-128x128-2x-ov.tz"
goto NEXT_0139
:SKIP_0139
echo Already exists. Skipping.
:NEXT_0139
echo.

echo [140/325] ghqv2_ldn-v1-fp16-128x128-2x-ox.tz
if exist "%DEST%\ghqv2_ldn-v1-fp16-128x128-2x-ox.tz" goto SKIP_0140
curl -L --fail --retry 3 -o "%DEST%\ghqv2_ldn-v1-fp16-128x128-2x-ox.tz" "%BASE_URL%/ghqv2_ldn-v1-fp16-128x128-2x-ox.tz"
goto NEXT_0140
:SKIP_0140
echo Already exists. Skipping.
:NEXT_0140
echo.

echo [141/325] ghqv2_ldn-v1-fp16-128x128-2x-rev2-ov.tz2
if exist "%DEST%\ghqv2_ldn-v1-fp16-128x128-2x-rev2-ov.tz2" goto SKIP_0141
curl -L --fail --retry 3 -o "%DEST%\ghqv2_ldn-v1-fp16-128x128-2x-rev2-ov.tz2" "%BASE_URL%/ghqv2_ldn-v1-fp16-128x128-2x-rev2-ov.tz2"
goto NEXT_0141
:SKIP_0141
echo Already exists. Skipping.
:NEXT_0141
echo.

echo [142/325] ghqv2_ldn-v1-fp16-128x128-4x-ov.tz
if exist "%DEST%\ghqv2_ldn-v1-fp16-128x128-4x-ov.tz" goto SKIP_0142
curl -L --fail --retry 3 -o "%DEST%\ghqv2_ldn-v1-fp16-128x128-4x-ov.tz" "%BASE_URL%/ghqv2_ldn-v1-fp16-128x128-4x-ov.tz"
goto NEXT_0142
:SKIP_0142
echo Already exists. Skipping.
:NEXT_0142
echo.

echo [143/325] ghqv2_ldn-v1-fp16-128x128-4x-ox.tz
if exist "%DEST%\ghqv2_ldn-v1-fp16-128x128-4x-ox.tz" goto SKIP_0143
curl -L --fail --retry 3 -o "%DEST%\ghqv2_ldn-v1-fp16-128x128-4x-ox.tz" "%BASE_URL%/ghqv2_ldn-v1-fp16-128x128-4x-ox.tz"
goto NEXT_0143
:SKIP_0143
echo Already exists. Skipping.
:NEXT_0143
echo.

echo [144/325] ghqv2_ldn-v1-fp16-128x128-4x-rev2-ov.tz2
if exist "%DEST%\ghqv2_ldn-v1-fp16-128x128-4x-rev2-ov.tz2" goto SKIP_0144
curl -L --fail --retry 3 -o "%DEST%\ghqv2_ldn-v1-fp16-128x128-4x-rev2-ov.tz2" "%BASE_URL%/ghqv2_ldn-v1-fp16-128x128-4x-rev2-ov.tz2"
goto NEXT_0144
:SKIP_0144
echo Already exists. Skipping.
:NEXT_0144
echo.

echo [145/325] ghqv2_ldn-v1-fp32-128x128-2x-ox.tz2
if exist "%DEST%\ghqv2_ldn-v1-fp32-128x128-2x-ox.tz2" goto SKIP_0145
curl -L --fail --retry 3 -o "%DEST%\ghqv2_ldn-v1-fp32-128x128-2x-ox.tz2" "%BASE_URL%/ghqv2_ldn-v1-fp32-128x128-2x-ox.tz2"
goto NEXT_0145
:SKIP_0145
echo Already exists. Skipping.
:NEXT_0145
echo.

echo [146/325] ghqv2_ldn-v1-fp32-128x128-4x-ox.tz2
if exist "%DEST%\ghqv2_ldn-v1-fp32-128x128-4x-ox.tz2" goto SKIP_0146
curl -L --fail --retry 3 -o "%DEST%\ghqv2_ldn-v1-fp32-128x128-4x-ox.tz2" "%BASE_URL%/ghqv2_ldn-v1-fp32-128x128-4x-ox.tz2"
goto NEXT_0146
:SKIP_0146
echo Already exists. Skipping.
:NEXT_0146
echo.

echo [147/325] ghqv3-v2-fp16-512x512-ox.tz2
if exist "%DEST%\ghqv3-v2-fp16-512x512-ox.tz2" goto SKIP_0147
curl -L --fail --retry 3 -o "%DEST%\ghqv3-v2-fp16-512x512-ox.tz2" "%BASE_URL%/ghqv3-v2-fp16-512x512-ox.tz2"
goto NEXT_0147
:SKIP_0147
echo Already exists. Skipping.
:NEXT_0147
echo.

echo [148/325] ghqv3-v2-fp16-512x512-rev1-ort.tz2
if exist "%DEST%\ghqv3-v2-fp16-512x512-rev1-ort.tz2" goto SKIP_0148
curl -L --fail --retry 3 -o "%DEST%\ghqv3-v2-fp16-512x512-rev1-ort.tz2" "%BASE_URL%/ghqv3-v2-fp16-512x512-rev1-ort.tz2"
goto NEXT_0148
:SKIP_0148
echo Already exists. Skipping.
:NEXT_0148
echo.

echo [149/325] ghqv3-v2-fp16-512x512-rev1-ox.tz2
if exist "%DEST%\ghqv3-v2-fp16-512x512-rev1-ox.tz2" goto SKIP_0149
curl -L --fail --retry 3 -o "%DEST%\ghqv3-v2-fp16-512x512-rev1-ox.tz2" "%BASE_URL%/ghqv3-v2-fp16-512x512-rev1-ox.tz2"
goto NEXT_0149
:SKIP_0149
echo Already exists. Skipping.
:NEXT_0149
echo.

echo [150/325] ghqv3_cache-v2-fp16-224x224-ox.tz2
if exist "%DEST%\ghqv3_cache-v2-fp16-224x224-ox.tz2" goto SKIP_0150
curl -L --fail --retry 3 -o "%DEST%\ghqv3_cache-v2-fp16-224x224-ox.tz2" "%BASE_URL%/ghqv3_cache-v2-fp16-224x224-ox.tz2"
goto NEXT_0150
:SKIP_0150
echo Already exists. Skipping.
:NEXT_0150
echo.

echo [151/325] gmp-v1-fp32-192x192-2x-ov.tz2
if exist "%DEST%\gmp-v1-fp32-192x192-2x-ov.tz2" goto SKIP_0151
curl -L --fail --retry 3 -o "%DEST%\gmp-v1-fp32-192x192-2x-ov.tz2" "%BASE_URL%/gmp-v1-fp32-192x192-2x-ov.tz2"
goto NEXT_0151
:SKIP_0151
echo Already exists. Skipping.
:NEXT_0151
echo.

echo [152/325] gmp-v1-fp32-192x192-4x-ov.tz2
if exist "%DEST%\gmp-v1-fp32-192x192-4x-ov.tz2" goto SKIP_0152
curl -L --fail --retry 3 -o "%DEST%\gmp-v1-fp32-192x192-4x-ov.tz2" "%BASE_URL%/gmp-v1-fp32-192x192-4x-ov.tz2"
goto NEXT_0152
:SKIP_0152
echo Already exists. Skipping.
:NEXT_0152
echo.

echo [153/325] gmp-v2-fp32-192x192-2x-ox.tz2
if exist "%DEST%\gmp-v2-fp32-192x192-2x-ox.tz2" goto SKIP_0153
curl -L --fail --retry 3 -o "%DEST%\gmp-v2-fp32-192x192-2x-ox.tz2" "%BASE_URL%/gmp-v2-fp32-192x192-2x-ox.tz2"
goto NEXT_0153
:SKIP_0153
echo Already exists. Skipping.
:NEXT_0153
echo.

echo [154/325] gmp-v2-fp32-192x192-4x-ox.tz2
if exist "%DEST%\gmp-v2-fp32-192x192-4x-ox.tz2" goto SKIP_0154
curl -L --fail --retry 3 -o "%DEST%\gmp-v2-fp32-192x192-4x-ox.tz2" "%BASE_URL%/gmp-v2-fp32-192x192-4x-ox.tz2"
goto NEXT_0154
:SKIP_0154
echo Already exists. Skipping.
:NEXT_0154
echo.

echo [155/325] gmpv2-v13-fp16-192x192-2x-ov.tz
if exist "%DEST%\gmpv2-v13-fp16-192x192-2x-ov.tz" goto SKIP_0155
curl -L --fail --retry 3 -o "%DEST%\gmpv2-v13-fp16-192x192-2x-ov.tz" "%BASE_URL%/gmpv2-v13-fp16-192x192-2x-ov.tz"
goto NEXT_0155
:SKIP_0155
echo Already exists. Skipping.
:NEXT_0155
echo.

echo [156/325] gmpv2-v13-fp16-192x192-2x-ov.tz2
if exist "%DEST%\gmpv2-v13-fp16-192x192-2x-ov.tz2" goto SKIP_0156
curl -L --fail --retry 3 -o "%DEST%\gmpv2-v13-fp16-192x192-2x-ov.tz2" "%BASE_URL%/gmpv2-v13-fp16-192x192-2x-ov.tz2"
goto NEXT_0156
:SKIP_0156
echo Already exists. Skipping.
:NEXT_0156
echo.

echo [157/325] gmpv2-v13-fp16-192x192-4x-ov.tz
if exist "%DEST%\gmpv2-v13-fp16-192x192-4x-ov.tz" goto SKIP_0157
curl -L --fail --retry 3 -o "%DEST%\gmpv2-v13-fp16-192x192-4x-ov.tz" "%BASE_URL%/gmpv2-v13-fp16-192x192-4x-ov.tz"
goto NEXT_0157
:SKIP_0157
echo Already exists. Skipping.
:NEXT_0157
echo.

echo [158/325] gmpv2-v13-fp16-192x192-4x-ov.tz2
if exist "%DEST%\gmpv2-v13-fp16-192x192-4x-ov.tz2" goto SKIP_0158
curl -L --fail --retry 3 -o "%DEST%\gmpv2-v13-fp16-192x192-4x-ov.tz2" "%BASE_URL%/gmpv2-v13-fp16-192x192-4x-ov.tz2"
goto NEXT_0158
:SKIP_0158
echo Already exists. Skipping.
:NEXT_0158
echo.

echo [159/325] gmpv2-v13-fp32-192x192-2x-ox.tz2
if exist "%DEST%\gmpv2-v13-fp32-192x192-2x-ox.tz2" goto SKIP_0159
curl -L --fail --retry 3 -o "%DEST%\gmpv2-v13-fp32-192x192-2x-ox.tz2" "%BASE_URL%/gmpv2-v13-fp32-192x192-2x-ox.tz2"
goto NEXT_0159
:SKIP_0159
echo Already exists. Skipping.
:NEXT_0159
echo.

echo [160/325] gmpv2-v13-fp32-192x192-4x-ox.tz2
if exist "%DEST%\gmpv2-v13-fp32-192x192-4x-ox.tz2" goto SKIP_0160
curl -L --fail --retry 3 -o "%DEST%\gmpv2-v13-fp32-192x192-4x-ox.tz2" "%BASE_URL%/gmpv2-v13-fp32-192x192-4x-ox.tz2"
goto NEXT_0160
:SKIP_0160
echo Already exists. Skipping.
:NEXT_0160
echo.

echo [161/325] iisa-v1-fp16-1024x1024-rev1-ox.tz2
if exist "%DEST%\iisa-v1-fp16-1024x1024-rev1-ox.tz2" goto SKIP_0161
curl -L --fail --retry 3 -o "%DEST%\iisa-v1-fp16-1024x1024-rev1-ox.tz2" "%BASE_URL%/iisa-v1-fp16-1024x1024-rev1-ox.tz2"
goto NEXT_0161
:SKIP_0161
echo Already exists. Skipping.
:NEXT_0161
echo.

echo [162/325] iisa-v1-fp32-ox.tz2
if exist "%DEST%\iisa-v1-fp32-ox.tz2" goto SKIP_0162
curl -L --fail --retry 3 -o "%DEST%\iisa-v1-fp32-ox.tz2" "%BASE_URL%/iisa-v1-fp32-ox.tz2"
goto NEXT_0162
:SKIP_0162
echo Already exists. Skipping.
:NEXT_0162
echo.

echo [163/325] iri-v1-fp32-800x800-ov.tz
if exist "%DEST%\iri-v1-fp32-800x800-ov.tz" goto SKIP_0163
curl -L --fail --retry 3 -o "%DEST%\iri-v1-fp32-800x800-ov.tz" "%BASE_URL%/iri-v1-fp32-800x800-ov.tz"
goto NEXT_0163
:SKIP_0163
echo Already exists. Skipping.
:NEXT_0163
echo.

echo [164/325] iri-v1-fp32-800x800-ov.tz2
if exist "%DEST%\iri-v1-fp32-800x800-ov.tz2" goto SKIP_0164
curl -L --fail --retry 3 -o "%DEST%\iri-v1-fp32-800x800-ov.tz2" "%BASE_URL%/iri-v1-fp32-800x800-ov.tz2"
goto NEXT_0164
:SKIP_0164
echo Already exists. Skipping.
:NEXT_0164
echo.

echo [165/325] iri-v1-fp32-800x800-ox.tz
if exist "%DEST%\iri-v1-fp32-800x800-ox.tz" goto SKIP_0165
curl -L --fail --retry 3 -o "%DEST%\iri-v1-fp32-800x800-ox.tz" "%BASE_URL%/iri-v1-fp32-800x800-ox.tz"
goto NEXT_0165
:SKIP_0165
echo Already exists. Skipping.
:NEXT_0165
echo.

echo [166/325] irwn_dec-v2-fp32-64x64-ox.tz2
if exist "%DEST%\irwn_dec-v2-fp32-64x64-ox.tz2" goto SKIP_0166
curl -L --fail --retry 3 -o "%DEST%\irwn_dec-v2-fp32-64x64-ox.tz2" "%BASE_URL%/irwn_dec-v2-fp32-64x64-ox.tz2"
goto NEXT_0166
:SKIP_0166
echo Already exists. Skipping.
:NEXT_0166
echo.

echo [167/325] irwn_dec-v2-fp32-64x64.onnx.data
if exist "%DEST%\irwn_dec-v2-fp32-64x64.onnx.data" goto SKIP_0167
curl -L --fail --retry 3 -o "%DEST%\irwn_dec-v2-fp32-64x64.onnx.data" "%BASE_URL%/irwn_dec-v2-fp32-64x64.onnx.data"
goto NEXT_0167
:SKIP_0167
echo Already exists. Skipping.
:NEXT_0167
echo.

echo [168/325] irwn_dit-v2-fp16-128x128-ox.tz2
if exist "%DEST%\irwn_dit-v2-fp16-128x128-ox.tz2" goto SKIP_0168
curl -L --fail --retry 3 -o "%DEST%\irwn_dit-v2-fp16-128x128-ox.tz2" "%BASE_URL%/irwn_dit-v2-fp16-128x128-ox.tz2"
goto NEXT_0168
:SKIP_0168
echo Already exists. Skipping.
:NEXT_0168
echo.

echo [169/325] irwn_dit-v2-fp16-128x128.onnx.data
if exist "%DEST%\irwn_dit-v2-fp16-128x128.onnx.data" goto SKIP_0169
curl -L --fail --retry 3 -o "%DEST%\irwn_dit-v2-fp16-128x128.onnx.data" "%BASE_URL%/irwn_dit-v2-fp16-128x128.onnx.data"
goto NEXT_0169
:SKIP_0169
echo Already exists. Skipping.
:NEXT_0169
echo.

echo [170/325] irwn_dit-v2-fp32-128x128-ox.tz2
if exist "%DEST%\irwn_dit-v2-fp32-128x128-ox.tz2" goto SKIP_0170
curl -L --fail --retry 3 -o "%DEST%\irwn_dit-v2-fp32-128x128-ox.tz2" "%BASE_URL%/irwn_dit-v2-fp32-128x128-ox.tz2"
goto NEXT_0170
:SKIP_0170
echo Already exists. Skipping.
:NEXT_0170
echo.

echo [171/325] irwn_dit-v2-fp32-128x128.onnx.data
if exist "%DEST%\irwn_dit-v2-fp32-128x128.onnx.data" goto SKIP_0171
curl -L --fail --retry 3 -o "%DEST%\irwn_dit-v2-fp32-128x128.onnx.data" "%BASE_URL%/irwn_dit-v2-fp32-128x128.onnx.data"
goto NEXT_0171
:SKIP_0171
echo Already exists. Skipping.
:NEXT_0171
echo.

echo [172/325] irwn_enc-v2-fp32-512x512-ox.tz2
if exist "%DEST%\irwn_enc-v2-fp32-512x512-ox.tz2" goto SKIP_0172
curl -L --fail --retry 3 -o "%DEST%\irwn_enc-v2-fp32-512x512-ox.tz2" "%BASE_URL%/irwn_enc-v2-fp32-512x512-ox.tz2"
goto NEXT_0172
:SKIP_0172
echo Already exists. Skipping.
:NEXT_0172
echo.

echo [173/325] irwn_enc-v2-fp32-512x512.onnx.data
if exist "%DEST%\irwn_enc-v2-fp32-512x512.onnx.data" goto SKIP_0173
curl -L --fail --retry 3 -o "%DEST%\irwn_enc-v2-fp32-512x512.onnx.data" "%BASE_URL%/irwn_enc-v2-fp32-512x512.onnx.data"
goto NEXT_0173
:SKIP_0173
echo Already exists. Skipping.
:NEXT_0173
echo.

echo [174/325] isoa-v1-fp32-512x512-ov.tz2
if exist "%DEST%\isoa-v1-fp32-512x512-ov.tz2" goto SKIP_0174
curl -L --fail --retry 3 -o "%DEST%\isoa-v1-fp32-512x512-ov.tz2" "%BASE_URL%/isoa-v1-fp32-512x512-ov.tz2"
goto NEXT_0174
:SKIP_0174
echo Already exists. Skipping.
:NEXT_0174
echo.

echo [175/325] isoa-v1-fp32-512x512-ox.tz2
if exist "%DEST%\isoa-v1-fp32-512x512-ox.tz2" goto SKIP_0175
curl -L --fail --retry 3 -o "%DEST%\isoa-v1-fp32-512x512-ox.tz2" "%BASE_URL%/isoa-v1-fp32-512x512-ox.tz2"
goto NEXT_0175
:SKIP_0175
echo Already exists. Skipping.
:NEXT_0175
echo.

echo [176/325] isob-v1-fp32-512x512-ov.tz2
if exist "%DEST%\isob-v1-fp32-512x512-ov.tz2" goto SKIP_0176
curl -L --fail --retry 3 -o "%DEST%\isob-v1-fp32-512x512-ov.tz2" "%BASE_URL%/isob-v1-fp32-512x512-ov.tz2"
goto NEXT_0176
:SKIP_0176
echo Already exists. Skipping.
:NEXT_0176
echo.

echo [177/325] isob-v1-fp32-512x512-ox.tz2
if exist "%DEST%\isob-v1-fp32-512x512-ox.tz2" goto SKIP_0177
curl -L --fail --retry 3 -o "%DEST%\isob-v1-fp32-512x512-ox.tz2" "%BASE_URL%/isob-v1-fp32-512x512-ox.tz2"
goto NEXT_0177
:SKIP_0177
echo Already exists. Skipping.
:NEXT_0177
echo.

echo [178/325] ldclc-v1-fp16-64x64-ov.tz
if exist "%DEST%\ldclc-v1-fp16-64x64-ov.tz" goto SKIP_0178
curl -L --fail --retry 3 -o "%DEST%\ldclc-v1-fp16-64x64-ov.tz" "%BASE_URL%/ldclc-v1-fp16-64x64-ov.tz"
goto NEXT_0178
:SKIP_0178
echo Already exists. Skipping.
:NEXT_0178
echo.

echo [179/325] ldclc-v1-fp16-64x64-ov.tz2
if exist "%DEST%\ldclc-v1-fp16-64x64-ov.tz2" goto SKIP_0179
curl -L --fail --retry 3 -o "%DEST%\ldclc-v1-fp16-64x64-ov.tz2" "%BASE_URL%/ldclc-v1-fp16-64x64-ov.tz2"
goto NEXT_0179
:SKIP_0179
echo Already exists. Skipping.
:NEXT_0179
echo.

echo [180/325] ldclc-v1-fp16-64x64-ox.tz
if exist "%DEST%\ldclc-v1-fp16-64x64-ox.tz" goto SKIP_0180
curl -L --fail --retry 3 -o "%DEST%\ldclc-v1-fp16-64x64-ox.tz" "%BASE_URL%/ldclc-v1-fp16-64x64-ox.tz"
goto NEXT_0180
:SKIP_0180
echo Already exists. Skipping.
:NEXT_0180
echo.

echo [181/325] ldclc-v1-fp16-64x64-ox.tz2
if exist "%DEST%\ldclc-v1-fp16-64x64-ox.tz2" goto SKIP_0181
curl -L --fail --retry 3 -o "%DEST%\ldclc-v1-fp16-64x64-ox.tz2" "%BASE_URL%/ldclc-v1-fp16-64x64-ox.tz2"
goto NEXT_0181
:SKIP_0181
echo Already exists. Skipping.
:NEXT_0181
echo.

echo [182/325] ldclc-v1-fp16-96x96-ox.tz2
if exist "%DEST%\ldclc-v1-fp16-96x96-ox.tz2" goto SKIP_0182
curl -L --fail --retry 3 -o "%DEST%\ldclc-v1-fp16-96x96-ox.tz2" "%BASE_URL%/ldclc-v1-fp16-96x96-ox.tz2"
goto NEXT_0182
:SKIP_0182
echo Already exists. Skipping.
:NEXT_0182
echo.

echo [183/325] ldclc-v1-fp32-64x64-ox.tz2
if exist "%DEST%\ldclc-v1-fp32-64x64-ox.tz2" goto SKIP_0183
curl -L --fail --retry 3 -o "%DEST%\ldclc-v1-fp32-64x64-ox.tz2" "%BASE_URL%/ldclc-v1-fp32-64x64-ox.tz2"
goto NEXT_0183
:SKIP_0183
echo Already exists. Skipping.
:NEXT_0183
echo.

echo [184/325] ldd21-v2-fp16-64x64-ov.tz
if exist "%DEST%\ldd21-v2-fp16-64x64-ov.tz" goto SKIP_0184
curl -L --fail --retry 3 -o "%DEST%\ldd21-v2-fp16-64x64-ov.tz" "%BASE_URL%/ldd21-v2-fp16-64x64-ov.tz"
goto NEXT_0184
:SKIP_0184
echo Already exists. Skipping.
:NEXT_0184
echo.

echo [185/325] ldd21-v2-fp16-64x64-ov.tz2
if exist "%DEST%\ldd21-v2-fp16-64x64-ov.tz2" goto SKIP_0185
curl -L --fail --retry 3 -o "%DEST%\ldd21-v2-fp16-64x64-ov.tz2" "%BASE_URL%/ldd21-v2-fp16-64x64-ov.tz2"
goto NEXT_0185
:SKIP_0185
echo Already exists. Skipping.
:NEXT_0185
echo.

echo [186/325] ldd21-v2-fp32-64x64-ox.tz2
if exist "%DEST%\ldd21-v2-fp32-64x64-ox.tz2" goto SKIP_0186
curl -L --fail --retry 3 -o "%DEST%\ldd21-v2-fp32-64x64-ox.tz2" "%BASE_URL%/ldd21-v2-fp32-64x64-ox.tz2"
goto NEXT_0186
:SKIP_0186
echo Already exists. Skipping.
:NEXT_0186
echo.

echo [187/325] lddv21-v1-fp16-64x64-ov.tz
if exist "%DEST%\lddv21-v1-fp16-64x64-ov.tz" goto SKIP_0187
curl -L --fail --retry 3 -o "%DEST%\lddv21-v1-fp16-64x64-ov.tz" "%BASE_URL%/lddv21-v1-fp16-64x64-ov.tz"
goto NEXT_0187
:SKIP_0187
echo Already exists. Skipping.
:NEXT_0187
echo.

echo [188/325] lddv21-v1-fp16-64x64-ov.tz2
if exist "%DEST%\lddv21-v1-fp16-64x64-ov.tz2" goto SKIP_0188
curl -L --fail --retry 3 -o "%DEST%\lddv21-v1-fp16-64x64-ov.tz2" "%BASE_URL%/lddv21-v1-fp16-64x64-ov.tz2"
goto NEXT_0188
:SKIP_0188
echo Already exists. Skipping.
:NEXT_0188
echo.

echo [189/325] lddv21-v1-fp32-64x64-ox.tz2
if exist "%DEST%\lddv21-v1-fp32-64x64-ox.tz2" goto SKIP_0189
curl -L --fail --retry 3 -o "%DEST%\lddv21-v1-fp32-64x64-ox.tz2" "%BASE_URL%/lddv21-v1-fp32-64x64-ox.tz2"
goto NEXT_0189
:SKIP_0189
echo Already exists. Skipping.
:NEXT_0189
echo.

echo [190/325] lde21-v1-fp16-512x512-ov.tz
if exist "%DEST%\lde21-v1-fp16-512x512-ov.tz" goto SKIP_0190
curl -L --fail --retry 3 -o "%DEST%\lde21-v1-fp16-512x512-ov.tz" "%BASE_URL%/lde21-v1-fp16-512x512-ov.tz"
goto NEXT_0190
:SKIP_0190
echo Already exists. Skipping.
:NEXT_0190
echo.

echo [191/325] lde21-v1-fp16-512x512-ov.tz2
if exist "%DEST%\lde21-v1-fp16-512x512-ov.tz2" goto SKIP_0191
curl -L --fail --retry 3 -o "%DEST%\lde21-v1-fp16-512x512-ov.tz2" "%BASE_URL%/lde21-v1-fp16-512x512-ov.tz2"
goto NEXT_0191
:SKIP_0191
echo Already exists. Skipping.
:NEXT_0191
echo.

echo [192/325] lde21-v1-fp32-512x512-ox.tz2
if exist "%DEST%\lde21-v1-fp32-512x512-ox.tz2" goto SKIP_0192
curl -L --fail --retry 3 -o "%DEST%\lde21-v1-fp32-512x512-ox.tz2" "%BASE_URL%/lde21-v1-fp32-512x512-ox.tz2"
goto NEXT_0192
:SKIP_0192
echo Already exists. Skipping.
:NEXT_0192
echo.

echo [193/325] ldu21-v2-fp16-64x64-ov.tz
if exist "%DEST%\ldu21-v2-fp16-64x64-ov.tz" goto SKIP_0193
curl -L --fail --retry 3 -o "%DEST%\ldu21-v2-fp16-64x64-ov.tz" "%BASE_URL%/ldu21-v2-fp16-64x64-ov.tz"
goto NEXT_0193
:SKIP_0193
echo Already exists. Skipping.
:NEXT_0193
echo.

echo [194/325] ldu21-v2-fp16-64x64-ov.tz2
if exist "%DEST%\ldu21-v2-fp16-64x64-ov.tz2" goto SKIP_0194
curl -L --fail --retry 3 -o "%DEST%\ldu21-v2-fp16-64x64-ov.tz2" "%BASE_URL%/ldu21-v2-fp16-64x64-ov.tz2"
goto NEXT_0194
:SKIP_0194
echo Already exists. Skipping.
:NEXT_0194
echo.

echo [195/325] ldu21-v2-fp32-64x64-rev1-ox.tz2
if exist "%DEST%\ldu21-v2-fp32-64x64-rev1-ox.tz2" goto SKIP_0195
curl -L --fail --retry 3 -o "%DEST%\ldu21-v2-fp32-64x64-rev1-ox.tz2" "%BASE_URL%/ldu21-v2-fp32-64x64-rev1-ox.tz2"
goto NEXT_0195
:SKIP_0195
echo Already exists. Skipping.
:NEXT_0195
echo.

echo [196/325] ldu21-v2-fp32-64x64-rev1.pb
if exist "%DEST%\ldu21-v2-fp32-64x64-rev1.pb" goto SKIP_0196
curl -L --fail --retry 3 -o "%DEST%\ldu21-v2-fp32-64x64-rev1.pb" "%BASE_URL%/ldu21-v2-fp32-64x64-rev1.pb"
goto NEXT_0196
:SKIP_0196
echo Already exists. Skipping.
:NEXT_0196
echo.

echo [197/325] lensblur-v3-fp32-512x512-ov.tz
if exist "%DEST%\lensblur-v3-fp32-512x512-ov.tz" goto SKIP_0197
curl -L --fail --retry 3 -o "%DEST%\lensblur-v3-fp32-512x512-ov.tz" "%BASE_URL%/lensblur-v3-fp32-512x512-ov.tz"
goto NEXT_0197
:SKIP_0197
echo Already exists. Skipping.
:NEXT_0197
echo.

echo [198/325] lensblur-v3-fp32-512x512-ov.tz2
if exist "%DEST%\lensblur-v3-fp32-512x512-ov.tz2" goto SKIP_0198
curl -L --fail --retry 3 -o "%DEST%\lensblur-v3-fp32-512x512-ov.tz2" "%BASE_URL%/lensblur-v3-fp32-512x512-ov.tz2"
goto NEXT_0198
:SKIP_0198
echo Already exists. Skipping.
:NEXT_0198
echo.

echo [199/325] lensblur-v3-fp32-512x512-ox.tz2
if exist "%DEST%\lensblur-v3-fp32-512x512-ox.tz2" goto SKIP_0199
curl -L --fail --retry 3 -o "%DEST%\lensblur-v3-fp32-512x512-ox.tz2" "%BASE_URL%/lensblur-v3-fp32-512x512-ox.tz2"
goto NEXT_0199
:SKIP_0199
echo Already exists. Skipping.
:NEXT_0199
echo.

echo [200/325] liting_det-v1-fp16-128x128-ox.tz2
if exist "%DEST%\liting_det-v1-fp16-128x128-ox.tz2" goto SKIP_0200
curl -L --fail --retry 3 -o "%DEST%\liting_det-v1-fp16-128x128-ox.tz2" "%BASE_URL%/liting_det-v1-fp16-128x128-ox.tz2"
goto NEXT_0200
:SKIP_0200
echo Already exists. Skipping.
:NEXT_0200
echo.

echo [201/325] liting_det-v1-fp16-128x128-rev2-ox.tz2
if exist "%DEST%\liting_det-v1-fp16-128x128-rev2-ox.tz2" goto SKIP_0201
curl -L --fail --retry 3 -o "%DEST%\liting_det-v1-fp16-128x128-rev2-ox.tz2" "%BASE_URL%/liting_det-v1-fp16-128x128-rev2-ox.tz2"
goto NEXT_0201
:SKIP_0201
echo Already exists. Skipping.
:NEXT_0201
echo.

echo [202/325] lmx-v1-fp16-512x512-ov.tz2
if exist "%DEST%\lmx-v1-fp16-512x512-ov.tz2" goto SKIP_0202
curl -L --fail --retry 3 -o "%DEST%\lmx-v1-fp16-512x512-ov.tz2" "%BASE_URL%/lmx-v1-fp16-512x512-ov.tz2"
goto NEXT_0202
:SKIP_0202
echo Already exists. Skipping.
:NEXT_0202
echo.

echo [203/325] lmx-v1-fp32-512x512-ox.tz2
if exist "%DEST%\lmx-v1-fp32-512x512-ox.tz2" goto SKIP_0203
curl -L --fail --retry 3 -o "%DEST%\lmx-v1-fp32-512x512-ox.tz2" "%BASE_URL%/lmx-v1-fp32-512x512-ox.tz2"
goto NEXT_0203
:SKIP_0203
echo Already exists. Skipping.
:NEXT_0203
echo.

echo [204/325] mobileclip2s2_age_of_photo_classifier.bin
if exist "%DEST%\mobileclip2s2_age_of_photo_classifier.bin" goto SKIP_0204
curl -L --fail --retry 3 -o "%DEST%\mobileclip2s2_age_of_photo_classifier.bin" "%BASE_URL%/mobileclip2s2_age_of_photo_classifier.bin"
goto NEXT_0204
:SKIP_0204
echo Already exists. Skipping.
:NEXT_0204
echo.

echo [205/325] mobileclip2s2_main_subject_classifier.bin
if exist "%DEST%\mobileclip2s2_main_subject_classifier.bin" goto SKIP_0205
curl -L --fail --retry 3 -o "%DEST%\mobileclip2s2_main_subject_classifier.bin" "%BASE_URL%/mobileclip2s2_main_subject_classifier.bin"
goto NEXT_0205
:SKIP_0205
echo Already exists. Skipping.
:NEXT_0205
echo.

echo [206/325] neg_emb.yaml
if exist "%DEST%\neg_emb.yaml" goto SKIP_0206
curl -L --fail --retry 3 -o "%DEST%\neg_emb.yaml" "%BASE_URL%/neg_emb.yaml"
goto NEXT_0206
:SKIP_0206
echo Already exists. Skipping.
:NEXT_0206
echo.

echo [207/325] noise_det-v1-fp16-128x128-1x-ox.tz2
if exist "%DEST%\noise_det-v1-fp16-128x128-1x-ox.tz2" goto SKIP_0207
curl -L --fail --retry 3 -o "%DEST%\noise_det-v1-fp16-128x128-1x-ox.tz2" "%BASE_URL%/noise_det-v1-fp16-128x128-1x-ox.tz2"
goto NEXT_0207
:SKIP_0207
echo Already exists. Skipping.
:NEXT_0207
echo.

echo [208/325] rxl_decoder0-v1-fp32-96x96-ox.tz2
if exist "%DEST%\rxl_decoder0-v1-fp32-96x96-ox.tz2" goto SKIP_0208
curl -L --fail --retry 3 -o "%DEST%\rxl_decoder0-v1-fp32-96x96-ox.tz2" "%BASE_URL%/rxl_decoder0-v1-fp32-96x96-ox.tz2"
goto NEXT_0208
:SKIP_0208
echo Already exists. Skipping.
:NEXT_0208
echo.

echo [209/325] rxl_decoder1-v1-fp32-120x120-ox.tz2
if exist "%DEST%\rxl_decoder1-v1-fp32-120x120-ox.tz2" goto SKIP_0209
curl -L --fail --retry 3 -o "%DEST%\rxl_decoder1-v1-fp32-120x120-ox.tz2" "%BASE_URL%/rxl_decoder1-v1-fp32-120x120-ox.tz2"
goto NEXT_0209
:SKIP_0209
echo Already exists. Skipping.
:NEXT_0209
echo.

echo [210/325] rxl_embed-v1-fp16-77x768-ox.tz2
if exist "%DEST%\rxl_embed-v1-fp16-77x768-ox.tz2" goto SKIP_0210
curl -L --fail --retry 3 -o "%DEST%\rxl_embed-v1-fp16-77x768-ox.tz2" "%BASE_URL%/rxl_embed-v1-fp16-77x768-ox.tz2"
goto NEXT_0210
:SKIP_0210
echo Already exists. Skipping.
:NEXT_0210
echo.

echo [211/325] rxl_encoder0-v1-fp32-768x768-ox.tz2
if exist "%DEST%\rxl_encoder0-v1-fp32-768x768-ox.tz2" goto SKIP_0211
curl -L --fail --retry 3 -o "%DEST%\rxl_encoder0-v1-fp32-768x768-ox.tz2" "%BASE_URL%/rxl_encoder0-v1-fp32-768x768-ox.tz2"
goto NEXT_0211
:SKIP_0211
echo Already exists. Skipping.
:NEXT_0211
echo.

echo [212/325] rxl_encoder1-v1-fp32-960x960-ox.tz2
if exist "%DEST%\rxl_encoder1-v1-fp32-960x960-ox.tz2" goto SKIP_0212
curl -L --fail --retry 3 -o "%DEST%\rxl_encoder1-v1-fp32-960x960-ox.tz2" "%BASE_URL%/rxl_encoder1-v1-fp32-960x960-ox.tz2"
goto NEXT_0212
:SKIP_0212
echo Already exists. Skipping.
:NEXT_0212
echo.

echo [213/325] rxl_merges.txt
if exist "%DEST%\rxl_merges.txt" goto SKIP_0213
curl -L --fail --retry 3 -o "%DEST%\rxl_merges.txt" "%BASE_URL%/rxl_merges.txt"
goto NEXT_0213
:SKIP_0213
echo Already exists. Skipping.
:NEXT_0213
echo.

echo [214/325] rxl_unet0-v2-fp16-ox.tz2
if exist "%DEST%\rxl_unet0-v2-fp16-ox.tz2" goto SKIP_0214
curl -L --fail --retry 3 -o "%DEST%\rxl_unet0-v2-fp16-ox.tz2" "%BASE_URL%/rxl_unet0-v2-fp16-ox.tz2"
goto NEXT_0214
:SKIP_0214
echo Already exists. Skipping.
:NEXT_0214
echo.

echo [215/325] rxl_unet0-v2-fp16.pb
if exist "%DEST%\rxl_unet0-v2-fp16.pb" goto SKIP_0215
curl -L --fail --retry 3 -o "%DEST%\rxl_unet0-v2-fp16.pb" "%BASE_URL%/rxl_unet0-v2-fp16.pb"
goto NEXT_0215
:SKIP_0215
echo Already exists. Skipping.
:NEXT_0215
echo.

echo [216/325] rxl_unet1-v2-fp16-ox.tz2
if exist "%DEST%\rxl_unet1-v2-fp16-ox.tz2" goto SKIP_0216
curl -L --fail --retry 3 -o "%DEST%\rxl_unet1-v2-fp16-ox.tz2" "%BASE_URL%/rxl_unet1-v2-fp16-ox.tz2"
goto NEXT_0216
:SKIP_0216
echo Already exists. Skipping.
:NEXT_0216
echo.

echo [217/325] rxl_unet1-v2-fp16.pb
if exist "%DEST%\rxl_unet1-v2-fp16.pb" goto SKIP_0217
curl -L --fail --retry 3 -o "%DEST%\rxl_unet1-v2-fp16.pb" "%BASE_URL%/rxl_unet1-v2-fp16.pb"
goto NEXT_0217
:SKIP_0217
echo Already exists. Skipping.
:NEXT_0217
echo.

echo [218/325] rxl_vocab.txt
if exist "%DEST%\rxl_vocab.txt" goto SKIP_0218
curl -L --fail --retry 3 -o "%DEST%\rxl_vocab.txt" "%BASE_URL%/rxl_vocab.txt"
goto NEXT_0218
:SKIP_0218
echo Already exists. Skipping.
:NEXT_0218
echo.

echo [219/325] s_mask_l_flexible-v2-fp16-320x320-ov.tz2
if exist "%DEST%\s_mask_l_flexible-v2-fp16-320x320-ov.tz2" goto SKIP_0219
curl -L --fail --retry 3 -o "%DEST%\s_mask_l_flexible-v2-fp16-320x320-ov.tz2" "%BASE_URL%/s_mask_l_flexible-v2-fp16-320x320-ov.tz2"
goto NEXT_0219
:SKIP_0219
echo Already exists. Skipping.
:NEXT_0219
echo.

echo [220/325] s_mask_l_flexible-v2-fp16-320x320-rev2-ox.tz2
if exist "%DEST%\s_mask_l_flexible-v2-fp16-320x320-rev2-ox.tz2" goto SKIP_0220
curl -L --fail --retry 3 -o "%DEST%\s_mask_l_flexible-v2-fp16-320x320-rev2-ox.tz2" "%BASE_URL%/s_mask_l_flexible-v2-fp16-320x320-rev2-ox.tz2"
goto NEXT_0220
:SKIP_0220
echo Already exists. Skipping.
:NEXT_0220
echo.

echo [221/325] samdec-v1-fp16-1024x1024-ov.tz
if exist "%DEST%\samdec-v1-fp16-1024x1024-ov.tz" goto SKIP_0221
curl -L --fail --retry 3 -o "%DEST%\samdec-v1-fp16-1024x1024-ov.tz" "%BASE_URL%/samdec-v1-fp16-1024x1024-ov.tz"
goto NEXT_0221
:SKIP_0221
echo Already exists. Skipping.
:NEXT_0221
echo.

echo [222/325] samdec-v1-fp16-1024x1024-ov.tz2
if exist "%DEST%\samdec-v1-fp16-1024x1024-ov.tz2" goto SKIP_0222
curl -L --fail --retry 3 -o "%DEST%\samdec-v1-fp16-1024x1024-ov.tz2" "%BASE_URL%/samdec-v1-fp16-1024x1024-ov.tz2"
goto NEXT_0222
:SKIP_0222
echo Already exists. Skipping.
:NEXT_0222
echo.

echo [223/325] samdec-v1-fp32-1024x1024-ox.tz
if exist "%DEST%\samdec-v1-fp32-1024x1024-ox.tz" goto SKIP_0223
curl -L --fail --retry 3 -o "%DEST%\samdec-v1-fp32-1024x1024-ox.tz" "%BASE_URL%/samdec-v1-fp32-1024x1024-ox.tz"
goto NEXT_0223
:SKIP_0223
echo Already exists. Skipping.
:NEXT_0223
echo.

echo [224/325] samdec-v1-fp32-1024x1024-ox.tz2
if exist "%DEST%\samdec-v1-fp32-1024x1024-ox.tz2" goto SKIP_0224
curl -L --fail --retry 3 -o "%DEST%\samdec-v1-fp32-1024x1024-ox.tz2" "%BASE_URL%/samdec-v1-fp32-1024x1024-ox.tz2"
goto NEXT_0224
:SKIP_0224
echo Already exists. Skipping.
:NEXT_0224
echo.

echo [225/325] samenc-v1-fp16-1024x1024-ov.tz
if exist "%DEST%\samenc-v1-fp16-1024x1024-ov.tz" goto SKIP_0225
curl -L --fail --retry 3 -o "%DEST%\samenc-v1-fp16-1024x1024-ov.tz" "%BASE_URL%/samenc-v1-fp16-1024x1024-ov.tz"
goto NEXT_0225
:SKIP_0225
echo Already exists. Skipping.
:NEXT_0225
echo.

echo [226/325] samenc-v1-fp16-1024x1024-ov.tz2
if exist "%DEST%\samenc-v1-fp16-1024x1024-ov.tz2" goto SKIP_0226
curl -L --fail --retry 3 -o "%DEST%\samenc-v1-fp16-1024x1024-ov.tz2" "%BASE_URL%/samenc-v1-fp16-1024x1024-ov.tz2"
goto NEXT_0226
:SKIP_0226
echo Already exists. Skipping.
:NEXT_0226
echo.

echo [227/325] samenc-v1-fp32-1024x1024-ox.tz
if exist "%DEST%\samenc-v1-fp32-1024x1024-ox.tz" goto SKIP_0227
curl -L --fail --retry 3 -o "%DEST%\samenc-v1-fp32-1024x1024-ox.tz" "%BASE_URL%/samenc-v1-fp32-1024x1024-ox.tz"
goto NEXT_0227
:SKIP_0227
echo Already exists. Skipping.
:NEXT_0227
echo.

echo [228/325] samenc-v1-fp32-1024x1024-ox.tz2
if exist "%DEST%\samenc-v1-fp32-1024x1024-ox.tz2" goto SKIP_0228
curl -L --fail --retry 3 -o "%DEST%\samenc-v1-fp32-1024x1024-ox.tz2" "%BASE_URL%/samenc-v1-fp32-1024x1024-ox.tz2"
goto NEXT_0228
:SKIP_0228
echo Already exists. Skipping.
:NEXT_0228
echo.

echo [229/325] sddustdec-v1-fp16-64x64-ov.tz2
if exist "%DEST%\sddustdec-v1-fp16-64x64-ov.tz2" goto SKIP_0229
curl -L --fail --retry 3 -o "%DEST%\sddustdec-v1-fp16-64x64-ov.tz2" "%BASE_URL%/sddustdec-v1-fp16-64x64-ov.tz2"
goto NEXT_0229
:SKIP_0229
echo Already exists. Skipping.
:NEXT_0229
echo.

echo [230/325] sddustdec-v2-fp16-64x64-ov.tz
if exist "%DEST%\sddustdec-v2-fp16-64x64-ov.tz" goto SKIP_0230
curl -L --fail --retry 3 -o "%DEST%\sddustdec-v2-fp16-64x64-ov.tz" "%BASE_URL%/sddustdec-v2-fp16-64x64-ov.tz"
goto NEXT_0230
:SKIP_0230
echo Already exists. Skipping.
:NEXT_0230
echo.

echo [231/325] sddustdec-v2-fp16-64x64-ox.tz
if exist "%DEST%\sddustdec-v2-fp16-64x64-ox.tz" goto SKIP_0231
curl -L --fail --retry 3 -o "%DEST%\sddustdec-v2-fp16-64x64-ox.tz" "%BASE_URL%/sddustdec-v2-fp16-64x64-ox.tz"
goto NEXT_0231
:SKIP_0231
echo Already exists. Skipping.
:NEXT_0231
echo.

echo [232/325] sddustenc-v1-fp16-512x512-ov.tz2
if exist "%DEST%\sddustenc-v1-fp16-512x512-ov.tz2" goto SKIP_0232
curl -L --fail --retry 3 -o "%DEST%\sddustenc-v1-fp16-512x512-ov.tz2" "%BASE_URL%/sddustenc-v1-fp16-512x512-ov.tz2"
goto NEXT_0232
:SKIP_0232
echo Already exists. Skipping.
:NEXT_0232
echo.

echo [233/325] sddustenc-v2-fp16-512x512-ov.tz
if exist "%DEST%\sddustenc-v2-fp16-512x512-ov.tz" goto SKIP_0233
curl -L --fail --retry 3 -o "%DEST%\sddustenc-v2-fp16-512x512-ov.tz" "%BASE_URL%/sddustenc-v2-fp16-512x512-ov.tz"
goto NEXT_0233
:SKIP_0233
echo Already exists. Skipping.
:NEXT_0233
echo.

echo [234/325] sddustenc-v2-fp16-512x512-ox.tz
if exist "%DEST%\sddustenc-v2-fp16-512x512-ox.tz" goto SKIP_0234
curl -L --fail --retry 3 -o "%DEST%\sddustenc-v2-fp16-512x512-ox.tz" "%BASE_URL%/sddustenc-v2-fp16-512x512-ox.tz"
goto NEXT_0234
:SKIP_0234
echo Already exists. Skipping.
:NEXT_0234
echo.

echo [235/325] sddustunet-v1-fp16-64x64-ov.tz2
if exist "%DEST%\sddustunet-v1-fp16-64x64-ov.tz2" goto SKIP_0235
curl -L --fail --retry 3 -o "%DEST%\sddustunet-v1-fp16-64x64-ov.tz2" "%BASE_URL%/sddustunet-v1-fp16-64x64-ov.tz2"
goto NEXT_0235
:SKIP_0235
echo Already exists. Skipping.
:NEXT_0235
echo.

echo [236/325] sddustunet-v2-fp16-64x64-ov.tz
if exist "%DEST%\sddustunet-v2-fp16-64x64-ov.tz" goto SKIP_0236
curl -L --fail --retry 3 -o "%DEST%\sddustunet-v2-fp16-64x64-ov.tz" "%BASE_URL%/sddustunet-v2-fp16-64x64-ov.tz"
goto NEXT_0236
:SKIP_0236
echo Already exists. Skipping.
:NEXT_0236
echo.

echo [237/325] sddustunet-v2-fp16-64x64-ox.tz
if exist "%DEST%\sddustunet-v2-fp16-64x64-ox.tz" goto SKIP_0237
curl -L --fail --retry 3 -o "%DEST%\sddustunet-v2-fp16-64x64-ox.tz" "%BASE_URL%/sddustunet-v2-fp16-64x64-ox.tz"
goto NEXT_0237
:SKIP_0237
echo Already exists. Skipping.
:NEXT_0237
echo.

echo [238/325] sdi_dec-v2-fp16-512x512-ov.tz2
if exist "%DEST%\sdi_dec-v2-fp16-512x512-ov.tz2" goto SKIP_0238
curl -L --fail --retry 3 -o "%DEST%\sdi_dec-v2-fp16-512x512-ov.tz2" "%BASE_URL%/sdi_dec-v2-fp16-512x512-ov.tz2"
goto NEXT_0238
:SKIP_0238
echo Already exists. Skipping.
:NEXT_0238
echo.

echo [239/325] sdi_dec-v2-fp16-512x512-ox.tz2
if exist "%DEST%\sdi_dec-v2-fp16-512x512-ox.tz2" goto SKIP_0239
curl -L --fail --retry 3 -o "%DEST%\sdi_dec-v2-fp16-512x512-ox.tz2" "%BASE_URL%/sdi_dec-v2-fp16-512x512-ox.tz2"
goto NEXT_0239
:SKIP_0239
echo Already exists. Skipping.
:NEXT_0239
echo.

echo [240/325] sdi_dec-v4-fp16-512x512-ox.tz2
if exist "%DEST%\sdi_dec-v4-fp16-512x512-ox.tz2" goto SKIP_0240
curl -L --fail --retry 3 -o "%DEST%\sdi_dec-v4-fp16-512x512-ox.tz2" "%BASE_URL%/sdi_dec-v4-fp16-512x512-ox.tz2"
goto NEXT_0240
:SKIP_0240
echo Already exists. Skipping.
:NEXT_0240
echo.

echo [241/325] sdi_embed0.bin
if exist "%DEST%\sdi_embed0.bin" goto SKIP_0241
curl -L --fail --retry 3 -o "%DEST%\sdi_embed0.bin" "%BASE_URL%/sdi_embed0.bin"
goto NEXT_0241
:SKIP_0241
echo Already exists. Skipping.
:NEXT_0241
echo.

echo [242/325] sdi_enc-v2-fp16-512x512-ov.tz2
if exist "%DEST%\sdi_enc-v2-fp16-512x512-ov.tz2" goto SKIP_0242
curl -L --fail --retry 3 -o "%DEST%\sdi_enc-v2-fp16-512x512-ov.tz2" "%BASE_URL%/sdi_enc-v2-fp16-512x512-ov.tz2"
goto NEXT_0242
:SKIP_0242
echo Already exists. Skipping.
:NEXT_0242
echo.

echo [243/325] sdi_enc-v2-fp16-512x512-ox.tz2
if exist "%DEST%\sdi_enc-v2-fp16-512x512-ox.tz2" goto SKIP_0243
curl -L --fail --retry 3 -o "%DEST%\sdi_enc-v2-fp16-512x512-ox.tz2" "%BASE_URL%/sdi_enc-v2-fp16-512x512-ox.tz2"
goto NEXT_0243
:SKIP_0243
echo Already exists. Skipping.
:NEXT_0243
echo.

echo [244/325] sdi_enc-v4-fp16-512x512-ox.tz2
if exist "%DEST%\sdi_enc-v4-fp16-512x512-ox.tz2" goto SKIP_0244
curl -L --fail --retry 3 -o "%DEST%\sdi_enc-v4-fp16-512x512-ox.tz2" "%BASE_URL%/sdi_enc-v4-fp16-512x512-ox.tz2"
goto NEXT_0244
:SKIP_0244
echo Already exists. Skipping.
:NEXT_0244
echo.

echo [245/325] sdi_imdn-v1-fp32-96x96-2x-ov.tz2
if exist "%DEST%\sdi_imdn-v1-fp32-96x96-2x-ov.tz2" goto SKIP_0245
curl -L --fail --retry 3 -o "%DEST%\sdi_imdn-v1-fp32-96x96-2x-ov.tz2" "%BASE_URL%/sdi_imdn-v1-fp32-96x96-2x-ov.tz2"
goto NEXT_0245
:SKIP_0245
echo Already exists. Skipping.
:NEXT_0245
echo.

echo [246/325] sdi_unet-v4-fp16-512x512-ort.tz2
if exist "%DEST%\sdi_unet-v4-fp16-512x512-ort.tz2" goto SKIP_0246
curl -L --fail --retry 3 -o "%DEST%\sdi_unet-v4-fp16-512x512-ort.tz2" "%BASE_URL%/sdi_unet-v4-fp16-512x512-ort.tz2"
goto NEXT_0246
:SKIP_0246
echo Already exists. Skipping.
:NEXT_0246
echo.

echo [247/325] sdi_unet-v4-fp16-512x512-ov.tz2
if exist "%DEST%\sdi_unet-v4-fp16-512x512-ov.tz2" goto SKIP_0247
curl -L --fail --retry 3 -o "%DEST%\sdi_unet-v4-fp16-512x512-ov.tz2" "%BASE_URL%/sdi_unet-v4-fp16-512x512-ov.tz2"
goto NEXT_0247
:SKIP_0247
echo Already exists. Skipping.
:NEXT_0247
echo.

echo [248/325] sdi_unet-v5-fp16-512x512-ox.tz2
if exist "%DEST%\sdi_unet-v5-fp16-512x512-ox.tz2" goto SKIP_0248
curl -L --fail --retry 3 -o "%DEST%\sdi_unet-v5-fp16-512x512-ox.tz2" "%BASE_URL%/sdi_unet-v5-fp16-512x512-ox.tz2"
goto NEXT_0248
:SKIP_0248
echo Already exists. Skipping.
:NEXT_0248
echo.

echo [249/325] slb-v1-fp32-512x512-ov.tz
if exist "%DEST%\slb-v1-fp32-512x512-ov.tz" goto SKIP_0249
curl -L --fail --retry 3 -o "%DEST%\slb-v1-fp32-512x512-ov.tz" "%BASE_URL%/slb-v1-fp32-512x512-ov.tz"
goto NEXT_0249
:SKIP_0249
echo Already exists. Skipping.
:NEXT_0249
echo.

echo [250/325] slb-v1-fp32-512x512-ov.tz2
if exist "%DEST%\slb-v1-fp32-512x512-ov.tz2" goto SKIP_0250
curl -L --fail --retry 3 -o "%DEST%\slb-v1-fp32-512x512-ov.tz2" "%BASE_URL%/slb-v1-fp32-512x512-ov.tz2"
goto NEXT_0250
:SKIP_0250
echo Already exists. Skipping.
:NEXT_0250
echo.

echo [251/325] slb-v1-fp32-512x512-ox.tz
if exist "%DEST%\slb-v1-fp32-512x512-ox.tz" goto SKIP_0251
curl -L --fail --retry 3 -o "%DEST%\slb-v1-fp32-512x512-ox.tz" "%BASE_URL%/slb-v1-fp32-512x512-ox.tz"
goto NEXT_0251
:SKIP_0251
echo Already exists. Skipping.
:NEXT_0251
echo.

echo [252/325] sll-v1-fp32-512x512-ov.tz
if exist "%DEST%\sll-v1-fp32-512x512-ov.tz" goto SKIP_0252
curl -L --fail --retry 3 -o "%DEST%\sll-v1-fp32-512x512-ov.tz" "%BASE_URL%/sll-v1-fp32-512x512-ov.tz"
goto NEXT_0252
:SKIP_0252
echo Already exists. Skipping.
:NEXT_0252
echo.

echo [253/325] sll-v1-fp32-512x512-ov.tz2
if exist "%DEST%\sll-v1-fp32-512x512-ov.tz2" goto SKIP_0253
curl -L --fail --retry 3 -o "%DEST%\sll-v1-fp32-512x512-ov.tz2" "%BASE_URL%/sll-v1-fp32-512x512-ov.tz2"
goto NEXT_0253
:SKIP_0253
echo Already exists. Skipping.
:NEXT_0253
echo.

echo [254/325] sll-v1-fp32-512x512-ox.tz
if exist "%DEST%\sll-v1-fp32-512x512-ox.tz" goto SKIP_0254
curl -L --fail --retry 3 -o "%DEST%\sll-v1-fp32-512x512-ox.tz" "%BASE_URL%/sll-v1-fp32-512x512-ox.tz"
goto NEXT_0254
:SKIP_0254
echo Already exists. Skipping.
:NEXT_0254
echo.

echo [255/325] sll-v1-fp32-512x512-ox.tz2
if exist "%DEST%\sll-v1-fp32-512x512-ox.tz2" goto SKIP_0255
curl -L --fail --retry 3 -o "%DEST%\sll-v1-fp32-512x512-ox.tz2" "%BASE_URL%/sll-v1-fp32-512x512-ox.tz2"
goto NEXT_0255
:SKIP_0255
echo Already exists. Skipping.
:NEXT_0255
echo.

echo [256/325] slsp-v3-fp32-512x512-ov.tz2
if exist "%DEST%\slsp-v3-fp32-512x512-ov.tz2" goto SKIP_0256
curl -L --fail --retry 3 -o "%DEST%\slsp-v3-fp32-512x512-ov.tz2" "%BASE_URL%/slsp-v3-fp32-512x512-ov.tz2"
goto NEXT_0256
:SKIP_0256
echo Already exists. Skipping.
:NEXT_0256
echo.

echo [257/325] slsp-v3-fp32-512x512-ox.tz2
if exist "%DEST%\slsp-v3-fp32-512x512-ox.tz2" goto SKIP_0257
curl -L --fail --retry 3 -o "%DEST%\slsp-v3-fp32-512x512-ox.tz2" "%BASE_URL%/slsp-v3-fp32-512x512-ox.tz2"
goto NEXT_0257
:SKIP_0257
echo Already exists. Skipping.
:NEXT_0257
echo.

echo [258/325] slsp_ap-v2-fp16-512x512-rev2-ox.tz2
if exist "%DEST%\slsp_ap-v2-fp16-512x512-rev2-ox.tz2" goto SKIP_0258
curl -L --fail --retry 3 -o "%DEST%\slsp_ap-v2-fp16-512x512-rev2-ox.tz2" "%BASE_URL%/slsp_ap-v2-fp16-512x512-rev2-ox.tz2"
goto NEXT_0258
:SKIP_0258
echo Already exists. Skipping.
:NEXT_0258
echo.

echo [259/325] slsp_ap-v2-fp32-512x512-ox.tz2
if exist "%DEST%\slsp_ap-v2-fp32-512x512-ox.tz2" goto SKIP_0259
curl -L --fail --retry 3 -o "%DEST%\slsp_ap-v2-fp32-512x512-ox.tz2" "%BASE_URL%/slsp_ap-v2-fp32-512x512-ox.tz2"
goto NEXT_0259
:SKIP_0259
echo Already exists. Skipping.
:NEXT_0259
echo.

echo [260/325] slsp_ap-v3-fp32-512x512-ov.tz2
if exist "%DEST%\slsp_ap-v3-fp32-512x512-ov.tz2" goto SKIP_0260
curl -L --fail --retry 3 -o "%DEST%\slsp_ap-v3-fp32-512x512-ov.tz2" "%BASE_URL%/slsp_ap-v3-fp32-512x512-ov.tz2"
goto NEXT_0260
:SKIP_0260
echo Already exists. Skipping.
:NEXT_0260
echo.

echo [261/325] smp_flexible-v2-fp16-320x320-ov.tz2
if exist "%DEST%\smp_flexible-v2-fp16-320x320-ov.tz2" goto SKIP_0261
curl -L --fail --retry 3 -o "%DEST%\smp_flexible-v2-fp16-320x320-ov.tz2" "%BASE_URL%/smp_flexible-v2-fp16-320x320-ov.tz2"
goto NEXT_0261
:SKIP_0261
echo Already exists. Skipping.
:NEXT_0261
echo.

echo [262/325] smp_flexible-v2-fp16-320x320-ox.tz2
if exist "%DEST%\smp_flexible-v2-fp16-320x320-ox.tz2" goto SKIP_0262
curl -L --fail --retry 3 -o "%DEST%\smp_flexible-v2-fp16-320x320-ox.tz2" "%BASE_URL%/smp_flexible-v2-fp16-320x320-ox.tz2"
goto NEXT_0262
:SKIP_0262
echo Already exists. Skipping.
:NEXT_0262
echo.

echo [263/325] sms_new-v3-fp16-320x320-ov.tz2
if exist "%DEST%\sms_new-v3-fp16-320x320-ov.tz2" goto SKIP_0263
curl -L --fail --retry 3 -o "%DEST%\sms_new-v3-fp16-320x320-ov.tz2" "%BASE_URL%/sms_new-v3-fp16-320x320-ov.tz2"
goto NEXT_0263
:SKIP_0263
echo Already exists. Skipping.
:NEXT_0263
echo.

echo [264/325] sms_new-v3-fp16-320x320-ox.tz2
if exist "%DEST%\sms_new-v3-fp16-320x320-ox.tz2" goto SKIP_0264
curl -L --fail --retry 3 -o "%DEST%\sms_new-v3-fp16-320x320-ox.tz2" "%BASE_URL%/sms_new-v3-fp16-320x320-ox.tz2"
goto NEXT_0264
:SKIP_0264
echo Already exists. Skipping.
:NEXT_0264
echo.

echo [265/325] sms_new-v3-fp16-320x320-rev2-ox.tz2
if exist "%DEST%\sms_new-v3-fp16-320x320-rev2-ox.tz2" goto SKIP_0265
curl -L --fail --retry 3 -o "%DEST%\sms_new-v3-fp16-320x320-rev2-ox.tz2" "%BASE_URL%/sms_new-v3-fp16-320x320-rev2-ox.tz2"
goto NEXT_0265
:SKIP_0265
echo Already exists. Skipping.
:NEXT_0265
echo.

echo [266/325] spfcdec-v1-fp16-64x64-ov.tz
if exist "%DEST%\spfcdec-v1-fp16-64x64-ov.tz" goto SKIP_0266
curl -L --fail --retry 3 -o "%DEST%\spfcdec-v1-fp16-64x64-ov.tz" "%BASE_URL%/spfcdec-v1-fp16-64x64-ov.tz"
goto NEXT_0266
:SKIP_0266
echo Already exists. Skipping.
:NEXT_0266
echo.

echo [267/325] spfcdec-v1-fp16-64x64-ov.tz2
if exist "%DEST%\spfcdec-v1-fp16-64x64-ov.tz2" goto SKIP_0267
curl -L --fail --retry 3 -o "%DEST%\spfcdec-v1-fp16-64x64-ov.tz2" "%BASE_URL%/spfcdec-v1-fp16-64x64-ov.tz2"
goto NEXT_0267
:SKIP_0267
echo Already exists. Skipping.
:NEXT_0267
echo.

echo [268/325] spfcdec-v1-fp32-64x64-ox.tz2
if exist "%DEST%\spfcdec-v1-fp32-64x64-ox.tz2" goto SKIP_0268
curl -L --fail --retry 3 -o "%DEST%\spfcdec-v1-fp32-64x64-ox.tz2" "%BASE_URL%/spfcdec-v1-fp32-64x64-ox.tz2"
goto NEXT_0268
:SKIP_0268
echo Already exists. Skipping.
:NEXT_0268
echo.

echo [269/325] spfcdit-v1-fp16-64x64-ov.tz
if exist "%DEST%\spfcdit-v1-fp16-64x64-ov.tz" goto SKIP_0269
curl -L --fail --retry 3 -o "%DEST%\spfcdit-v1-fp16-64x64-ov.tz" "%BASE_URL%/spfcdit-v1-fp16-64x64-ov.tz"
goto NEXT_0269
:SKIP_0269
echo Already exists. Skipping.
:NEXT_0269
echo.

echo [270/325] spfcdit-v1-fp16-64x64-ov.tz2
if exist "%DEST%\spfcdit-v1-fp16-64x64-ov.tz2" goto SKIP_0270
curl -L --fail --retry 3 -o "%DEST%\spfcdit-v1-fp16-64x64-ov.tz2" "%BASE_URL%/spfcdit-v1-fp16-64x64-ov.tz2"
goto NEXT_0270
:SKIP_0270
echo Already exists. Skipping.
:NEXT_0270
echo.

echo [271/325] spfcdit-v1-fp32-64x64-ox.tz2
if exist "%DEST%\spfcdit-v1-fp32-64x64-ox.tz2" goto SKIP_0271
curl -L --fail --retry 3 -o "%DEST%\spfcdit-v1-fp32-64x64-ox.tz2" "%BASE_URL%/spfcdit-v1-fp32-64x64-ox.tz2"
goto NEXT_0271
:SKIP_0271
echo Already exists. Skipping.
:NEXT_0271
echo.

echo [272/325] spfcenc-v1-fp16-512x512-ov.tz
if exist "%DEST%\spfcenc-v1-fp16-512x512-ov.tz" goto SKIP_0272
curl -L --fail --retry 3 -o "%DEST%\spfcenc-v1-fp16-512x512-ov.tz" "%BASE_URL%/spfcenc-v1-fp16-512x512-ov.tz"
goto NEXT_0272
:SKIP_0272
echo Already exists. Skipping.
:NEXT_0272
echo.

echo [273/325] spfcenc-v1-fp16-512x512-ov.tz2
if exist "%DEST%\spfcenc-v1-fp16-512x512-ov.tz2" goto SKIP_0273
curl -L --fail --retry 3 -o "%DEST%\spfcenc-v1-fp16-512x512-ov.tz2" "%BASE_URL%/spfcenc-v1-fp16-512x512-ov.tz2"
goto NEXT_0273
:SKIP_0273
echo Already exists. Skipping.
:NEXT_0273
echo.

echo [274/325] spfcenc-v1-fp32-512x512-ox.tz2
if exist "%DEST%\spfcenc-v1-fp32-512x512-ox.tz2" goto SKIP_0274
curl -L --fail --retry 3 -o "%DEST%\spfcenc-v1-fp32-512x512-ox.tz2" "%BASE_URL%/spfcenc-v1-fp32-512x512-ox.tz2"
goto NEXT_0274
:SKIP_0274
echo Already exists. Skipping.
:NEXT_0274
echo.

echo [275/325] ssddec0_0-v1-fp16-64x64-ov.tz
if exist "%DEST%\ssddec0_0-v1-fp16-64x64-ov.tz" goto SKIP_0275
curl -L --fail --retry 3 -o "%DEST%\ssddec0_0-v1-fp16-64x64-ov.tz" "%BASE_URL%/ssddec0_0-v1-fp16-64x64-ov.tz"
goto NEXT_0275
:SKIP_0275
echo Already exists. Skipping.
:NEXT_0275
echo.

echo [276/325] ssddec0_0-v1-fp16-64x64-ov.tz2
if exist "%DEST%\ssddec0_0-v1-fp16-64x64-ov.tz2" goto SKIP_0276
curl -L --fail --retry 3 -o "%DEST%\ssddec0_0-v1-fp16-64x64-ov.tz2" "%BASE_URL%/ssddec0_0-v1-fp16-64x64-ov.tz2"
goto NEXT_0276
:SKIP_0276
echo Already exists. Skipping.
:NEXT_0276
echo.

echo [277/325] ssddec0_0-v1-fp16-64x64-ox.tz
if exist "%DEST%\ssddec0_0-v1-fp16-64x64-ox.tz" goto SKIP_0277
curl -L --fail --retry 3 -o "%DEST%\ssddec0_0-v1-fp16-64x64-ox.tz" "%BASE_URL%/ssddec0_0-v1-fp16-64x64-ox.tz"
goto NEXT_0277
:SKIP_0277
echo Already exists. Skipping.
:NEXT_0277
echo.

echo [278/325] ssddec0_0-v1-fp32-64x64-ox.tz2
if exist "%DEST%\ssddec0_0-v1-fp32-64x64-ox.tz2" goto SKIP_0278
curl -L --fail --retry 3 -o "%DEST%\ssddec0_0-v1-fp32-64x64-ox.tz2" "%BASE_URL%/ssddec0_0-v1-fp32-64x64-ox.tz2"
goto NEXT_0278
:SKIP_0278
echo Already exists. Skipping.
:NEXT_0278
echo.

echo [279/325] ssddec0_5-v1-fp16-64x64-ov.tz
if exist "%DEST%\ssddec0_5-v1-fp16-64x64-ov.tz" goto SKIP_0279
curl -L --fail --retry 3 -o "%DEST%\ssddec0_5-v1-fp16-64x64-ov.tz" "%BASE_URL%/ssddec0_5-v1-fp16-64x64-ov.tz"
goto NEXT_0279
:SKIP_0279
echo Already exists. Skipping.
:NEXT_0279
echo.

echo [280/325] ssddec0_5-v1-fp16-64x64-ov.tz2
if exist "%DEST%\ssddec0_5-v1-fp16-64x64-ov.tz2" goto SKIP_0280
curl -L --fail --retry 3 -o "%DEST%\ssddec0_5-v1-fp16-64x64-ov.tz2" "%BASE_URL%/ssddec0_5-v1-fp16-64x64-ov.tz2"
goto NEXT_0280
:SKIP_0280
echo Already exists. Skipping.
:NEXT_0280
echo.

echo [281/325] ssddec0_5-v1-fp16-64x64-ox.tz
if exist "%DEST%\ssddec0_5-v1-fp16-64x64-ox.tz" goto SKIP_0281
curl -L --fail --retry 3 -o "%DEST%\ssddec0_5-v1-fp16-64x64-ox.tz" "%BASE_URL%/ssddec0_5-v1-fp16-64x64-ox.tz"
goto NEXT_0281
:SKIP_0281
echo Already exists. Skipping.
:NEXT_0281
echo.

echo [282/325] ssddec0_5-v1-fp32-64x64-ox.tz2
if exist "%DEST%\ssddec0_5-v1-fp32-64x64-ox.tz2" goto SKIP_0282
curl -L --fail --retry 3 -o "%DEST%\ssddec0_5-v1-fp32-64x64-ox.tz2" "%BASE_URL%/ssddec0_5-v1-fp32-64x64-ox.tz2"
goto NEXT_0282
:SKIP_0282
echo Already exists. Skipping.
:NEXT_0282
echo.

echo [283/325] ssddec1_0-v1-fp16-64x64-ov.tz
if exist "%DEST%\ssddec1_0-v1-fp16-64x64-ov.tz" goto SKIP_0283
curl -L --fail --retry 3 -o "%DEST%\ssddec1_0-v1-fp16-64x64-ov.tz" "%BASE_URL%/ssddec1_0-v1-fp16-64x64-ov.tz"
goto NEXT_0283
:SKIP_0283
echo Already exists. Skipping.
:NEXT_0283
echo.

echo [284/325] ssddec1_0-v1-fp16-64x64-ov.tz2
if exist "%DEST%\ssddec1_0-v1-fp16-64x64-ov.tz2" goto SKIP_0284
curl -L --fail --retry 3 -o "%DEST%\ssddec1_0-v1-fp16-64x64-ov.tz2" "%BASE_URL%/ssddec1_0-v1-fp16-64x64-ov.tz2"
goto NEXT_0284
:SKIP_0284
echo Already exists. Skipping.
:NEXT_0284
echo.

echo [285/325] ssddec1_0-v1-fp16-64x64-ox.tz
if exist "%DEST%\ssddec1_0-v1-fp16-64x64-ox.tz" goto SKIP_0285
curl -L --fail --retry 3 -o "%DEST%\ssddec1_0-v1-fp16-64x64-ox.tz" "%BASE_URL%/ssddec1_0-v1-fp16-64x64-ox.tz"
goto NEXT_0285
:SKIP_0285
echo Already exists. Skipping.
:NEXT_0285
echo.

echo [286/325] ssddec1_0-v1-fp32-64x64-ox.tz2
if exist "%DEST%\ssddec1_0-v1-fp32-64x64-ox.tz2" goto SKIP_0286
curl -L --fail --retry 3 -o "%DEST%\ssddec1_0-v1-fp32-64x64-ox.tz2" "%BASE_URL%/ssddec1_0-v1-fp32-64x64-ox.tz2"
goto NEXT_0286
:SKIP_0286
echo Already exists. Skipping.
:NEXT_0286
echo.

echo [287/325] ssdenc-sharpen-v1-fp16-512x512-ov.tz
if exist "%DEST%\ssdenc-sharpen-v1-fp16-512x512-ov.tz" goto SKIP_0287
curl -L --fail --retry 3 -o "%DEST%\ssdenc-sharpen-v1-fp16-512x512-ov.tz" "%BASE_URL%/ssdenc-sharpen-v1-fp16-512x512-ov.tz"
goto NEXT_0287
:SKIP_0287
echo Already exists. Skipping.
:NEXT_0287
echo.

echo [288/325] ssdenc-sharpen-v1-fp16-512x512-ov.tz2
if exist "%DEST%\ssdenc-sharpen-v1-fp16-512x512-ov.tz2" goto SKIP_0288
curl -L --fail --retry 3 -o "%DEST%\ssdenc-sharpen-v1-fp16-512x512-ov.tz2" "%BASE_URL%/ssdenc-sharpen-v1-fp16-512x512-ov.tz2"
goto NEXT_0288
:SKIP_0288
echo Already exists. Skipping.
:NEXT_0288
echo.

echo [289/325] ssdenc-sharpen-v1-fp16-512x512-ox.tz
if exist "%DEST%\ssdenc-sharpen-v1-fp16-512x512-ox.tz" goto SKIP_0289
curl -L --fail --retry 3 -o "%DEST%\ssdenc-sharpen-v1-fp16-512x512-ox.tz" "%BASE_URL%/ssdenc-sharpen-v1-fp16-512x512-ox.tz"
goto NEXT_0289
:SKIP_0289
echo Already exists. Skipping.
:NEXT_0289
echo.

echo [290/325] ssdenc-v1-fp16-512x512-ov.tz2
if exist "%DEST%\ssdenc-v1-fp16-512x512-ov.tz2" goto SKIP_0290
curl -L --fail --retry 3 -o "%DEST%\ssdenc-v1-fp16-512x512-ov.tz2" "%BASE_URL%/ssdenc-v1-fp16-512x512-ov.tz2"
goto NEXT_0290
:SKIP_0290
echo Already exists. Skipping.
:NEXT_0290
echo.

echo [291/325] ssdenc-v1-fp16-512x512-ox.tz2
if exist "%DEST%\ssdenc-v1-fp16-512x512-ox.tz2" goto SKIP_0291
curl -L --fail --retry 3 -o "%DEST%\ssdenc-v1-fp16-512x512-ox.tz2" "%BASE_URL%/ssdenc-v1-fp16-512x512-ox.tz2"
goto NEXT_0291
:SKIP_0291
echo Already exists. Skipping.
:NEXT_0291
echo.

echo [292/325] ssdunet-sharpen-v1-fp16-64x64-ov.tz
if exist "%DEST%\ssdunet-sharpen-v1-fp16-64x64-ov.tz" goto SKIP_0292
curl -L --fail --retry 3 -o "%DEST%\ssdunet-sharpen-v1-fp16-64x64-ov.tz" "%BASE_URL%/ssdunet-sharpen-v1-fp16-64x64-ov.tz"
goto NEXT_0292
:SKIP_0292
echo Already exists. Skipping.
:NEXT_0292
echo.

echo [293/325] ssdunet-sharpen-v1-fp16-64x64-ov.tz2
if exist "%DEST%\ssdunet-sharpen-v1-fp16-64x64-ov.tz2" goto SKIP_0293
curl -L --fail --retry 3 -o "%DEST%\ssdunet-sharpen-v1-fp16-64x64-ov.tz2" "%BASE_URL%/ssdunet-sharpen-v1-fp16-64x64-ov.tz2"
goto NEXT_0293
:SKIP_0293
echo Already exists. Skipping.
:NEXT_0293
echo.

echo [294/325] ssdunet-sharpen-v1-fp16-64x64-ox.tz
if exist "%DEST%\ssdunet-sharpen-v1-fp16-64x64-ox.tz" goto SKIP_0294
curl -L --fail --retry 3 -o "%DEST%\ssdunet-sharpen-v1-fp16-64x64-ox.tz" "%BASE_URL%/ssdunet-sharpen-v1-fp16-64x64-ox.tz"
goto NEXT_0294
:SKIP_0294
echo Already exists. Skipping.
:NEXT_0294
echo.

echo [295/325] ssdunet-v1-fp16-64x64-ov.tz2
if exist "%DEST%\ssdunet-v1-fp16-64x64-ov.tz2" goto SKIP_0295
curl -L --fail --retry 3 -o "%DEST%\ssdunet-v1-fp16-64x64-ov.tz2" "%BASE_URL%/ssdunet-v1-fp16-64x64-ov.tz2"
goto NEXT_0295
:SKIP_0295
echo Already exists. Skipping.
:NEXT_0295
echo.

echo [296/325] ssdunet-v1-fp32-64x64-rev1-ox.tz2
if exist "%DEST%\ssdunet-v1-fp32-64x64-rev1-ox.tz2" goto SKIP_0296
curl -L --fail --retry 3 -o "%DEST%\ssdunet-v1-fp32-64x64-rev1-ox.tz2" "%BASE_URL%/ssdunet-v1-fp32-64x64-rev1-ox.tz2"
goto NEXT_0296
:SKIP_0296
echo Already exists. Skipping.
:NEXT_0296
echo.

echo [297/325] ssdunet-v1-fp32-64x64-rev1.onnx.data
if exist "%DEST%\ssdunet-v1-fp32-64x64-rev1.onnx.data" goto SKIP_0297
curl -L --fail --retry 3 -o "%DEST%\ssdunet-v1-fp32-64x64-rev1.onnx.data" "%BASE_URL%/ssdunet-v1-fp32-64x64-rev1.onnx.data"
goto NEXT_0297
:SKIP_0297
echo Already exists. Skipping.
:NEXT_0297
echo.

echo [298/325] sstd-v2-fp32-512x512-ov.tz2
if exist "%DEST%\sstd-v2-fp32-512x512-ov.tz2" goto SKIP_0298
curl -L --fail --retry 3 -o "%DEST%\sstd-v2-fp32-512x512-ov.tz2" "%BASE_URL%/sstd-v2-fp32-512x512-ov.tz2"
goto NEXT_0298
:SKIP_0298
echo Already exists. Skipping.
:NEXT_0298
echo.

echo [299/325] sstd-v2-fp32-512x512-ox.tz2
if exist "%DEST%\sstd-v2-fp32-512x512-ox.tz2" goto SKIP_0299
curl -L --fail --retry 3 -o "%DEST%\sstd-v2-fp32-512x512-ox.tz2" "%BASE_URL%/sstd-v2-fp32-512x512-ox.tz2"
goto NEXT_0299
:SKIP_0299
echo Already exists. Skipping.
:NEXT_0299
echo.

echo [300/325] sstd_ahres-v1-fp32-512x512-ox.tz2
if exist "%DEST%\sstd_ahres-v1-fp32-512x512-ox.tz2" goto SKIP_0300
curl -L --fail --retry 3 -o "%DEST%\sstd_ahres-v1-fp32-512x512-ox.tz2" "%BASE_URL%/sstd_ahres-v1-fp32-512x512-ox.tz2"
goto NEXT_0300
:SKIP_0300
echo Already exists. Skipping.
:NEXT_0300
echo.

echo [301/325] sstd_phres-v1-fp32-512x512-ox.tz2
if exist "%DEST%\sstd_phres-v1-fp32-512x512-ox.tz2" goto SKIP_0301
curl -L --fail --retry 3 -o "%DEST%\sstd_phres-v1-fp32-512x512-ox.tz2" "%BASE_URL%/sstd_phres-v1-fp32-512x512-ox.tz2"
goto NEXT_0301
:SKIP_0301
echo Already exists. Skipping.
:NEXT_0301
echo.

echo [302/325] sstg-v1-fp32-512x512-ov.tz2
if exist "%DEST%\sstg-v1-fp32-512x512-ov.tz2" goto SKIP_0302
curl -L --fail --retry 3 -o "%DEST%\sstg-v1-fp32-512x512-ov.tz2" "%BASE_URL%/sstg-v1-fp32-512x512-ov.tz2"
goto NEXT_0302
:SKIP_0302
echo Already exists. Skipping.
:NEXT_0302
echo.

echo [303/325] sstg-v1-fp32-512x512-ox.tz2
if exist "%DEST%\sstg-v1-fp32-512x512-ox.tz2" goto SKIP_0303
curl -L --fail --retry 3 -o "%DEST%\sstg-v1-fp32-512x512-ox.tz2" "%BASE_URL%/sstg-v1-fp32-512x512-ox.tz2"
goto NEXT_0303
:SKIP_0303
echo Already exists. Skipping.
:NEXT_0303
echo.

echo [304/325] stdmax-v1-fp16-192x192-ov.tz2
if exist "%DEST%\stdmax-v1-fp16-192x192-ov.tz2" goto SKIP_0304
curl -L --fail --retry 3 -o "%DEST%\stdmax-v1-fp16-192x192-ov.tz2" "%BASE_URL%/stdmax-v1-fp16-192x192-ov.tz2"
goto NEXT_0304
:SKIP_0304
echo Already exists. Skipping.
:NEXT_0304
echo.

echo [305/325] stdmax-v1-fp16-192x192-ox.tz2
if exist "%DEST%\stdmax-v1-fp16-192x192-ox.tz2" goto SKIP_0305
curl -L --fail --retry 3 -o "%DEST%\stdmax-v1-fp16-192x192-ox.tz2" "%BASE_URL%/stdmax-v1-fp16-192x192-ox.tz2"
goto NEXT_0305
:SKIP_0305
echo Already exists. Skipping.
:NEXT_0305
echo.

echo [306/325] tpn_dec-v1-fp16-64x64-ox.tz2
if exist "%DEST%\tpn_dec-v1-fp16-64x64-ox.tz2" goto SKIP_0306
curl -L --fail --retry 3 -o "%DEST%\tpn_dec-v1-fp16-64x64-ox.tz2" "%BASE_URL%/tpn_dec-v1-fp16-64x64-ox.tz2"
goto NEXT_0306
:SKIP_0306
echo Already exists. Skipping.
:NEXT_0306
echo.

echo [307/325] tpn_embeds.bin
if exist "%DEST%\tpn_embeds.bin" goto SKIP_0307
curl -L --fail --retry 3 -o "%DEST%\tpn_embeds.bin" "%BASE_URL%/tpn_embeds.bin"
goto NEXT_0307
:SKIP_0307
echo Already exists. Skipping.
:NEXT_0307
echo.

echo [308/325] tpn_enc-v1-fp16-512x512-ox.tz2
if exist "%DEST%\tpn_enc-v1-fp16-512x512-ox.tz2" goto SKIP_0308
curl -L --fail --retry 3 -o "%DEST%\tpn_enc-v1-fp16-512x512-ox.tz2" "%BASE_URL%/tpn_enc-v1-fp16-512x512-ox.tz2"
goto NEXT_0308
:SKIP_0308
echo Already exists. Skipping.
:NEXT_0308
echo.

echo [309/325] tpn_unet-v1-fp16-64x64-ox.tz2
if exist "%DEST%\tpn_unet-v1-fp16-64x64-ox.tz2" goto SKIP_0309
curl -L --fail --retry 3 -o "%DEST%\tpn_unet-v1-fp16-64x64-ox.tz2" "%BASE_URL%/tpn_unet-v1-fp16-64x64-ox.tz2"
goto NEXT_0309
:SKIP_0309
echo Already exists. Skipping.
:NEXT_0309
echo.

echo [310/325] trf-v1-fp16-128x128-2x-ov.tz2
if exist "%DEST%\trf-v1-fp16-128x128-2x-ov.tz2" goto SKIP_0310
curl -L --fail --retry 3 -o "%DEST%\trf-v1-fp16-128x128-2x-ov.tz2" "%BASE_URL%/trf-v1-fp16-128x128-2x-ov.tz2"
goto NEXT_0310
:SKIP_0310
echo Already exists. Skipping.
:NEXT_0310
echo.

echo [311/325] trf-v1-fp16-128x128-2x-ox.tz2
if exist "%DEST%\trf-v1-fp16-128x128-2x-ox.tz2" goto SKIP_0311
curl -L --fail --retry 3 -o "%DEST%\trf-v1-fp16-128x128-2x-ox.tz2" "%BASE_URL%/trf-v1-fp16-128x128-2x-ox.tz2"
goto NEXT_0311
:SKIP_0311
echo Already exists. Skipping.
:NEXT_0311
echo.

echo [312/325] trf-v1-fp16-128x128-4x-ov.tz2
if exist "%DEST%\trf-v1-fp16-128x128-4x-ov.tz2" goto SKIP_0312
curl -L --fail --retry 3 -o "%DEST%\trf-v1-fp16-128x128-4x-ov.tz2" "%BASE_URL%/trf-v1-fp16-128x128-4x-ov.tz2"
goto NEXT_0312
:SKIP_0312
echo Already exists. Skipping.
:NEXT_0312
echo.

echo [313/325] trf-v1-fp16-128x128-4x-ox.tz2
if exist "%DEST%\trf-v1-fp16-128x128-4x-ox.tz2" goto SKIP_0313
curl -L --fail --retry 3 -o "%DEST%\trf-v1-fp16-128x128-4x-ox.tz2" "%BASE_URL%/trf-v1-fp16-128x128-4x-ox.tz2"
goto NEXT_0313
:SKIP_0313
echo Already exists. Skipping.
:NEXT_0313
echo.

echo [314/325] trf-v1-fp32-128x128-2x-ox.tz2
if exist "%DEST%\trf-v1-fp32-128x128-2x-ox.tz2" goto SKIP_0314
curl -L --fail --retry 3 -o "%DEST%\trf-v1-fp32-128x128-2x-ox.tz2" "%BASE_URL%/trf-v1-fp32-128x128-2x-ox.tz2"
goto NEXT_0314
:SKIP_0314
echo Already exists. Skipping.
:NEXT_0314
echo.

echo [315/325] trf-v1-fp32-128x128-4x-ox.tz2
if exist "%DEST%\trf-v1-fp32-128x128-4x-ox.tz2" goto SKIP_0315
curl -L --fail --retry 3 -o "%DEST%\trf-v1-fp32-128x128-4x-ox.tz2" "%BASE_URL%/trf-v1-fp32-128x128-4x-ox.tz2"
goto NEXT_0315
:SKIP_0315
echo Already exists. Skipping.
:NEXT_0315
echo.

echo [316/325] trfn-v1-fp16-512x512-1x-ov.tz2
if exist "%DEST%\trfn-v1-fp16-512x512-1x-ov.tz2" goto SKIP_0316
curl -L --fail --retry 3 -o "%DEST%\trfn-v1-fp16-512x512-1x-ov.tz2" "%BASE_URL%/trfn-v1-fp16-512x512-1x-ov.tz2"
goto NEXT_0316
:SKIP_0316
echo Already exists. Skipping.
:NEXT_0316
echo.

echo [317/325] trfn-v1-fp16-512x512-1x-ox.tz2
if exist "%DEST%\trfn-v1-fp16-512x512-1x-ox.tz2" goto SKIP_0317
curl -L --fail --retry 3 -o "%DEST%\trfn-v1-fp16-512x512-1x-ox.tz2" "%BASE_URL%/trfn-v1-fp16-512x512-1x-ox.tz2"
goto NEXT_0317
:SKIP_0317
echo Already exists. Skipping.
:NEXT_0317
echo.

echo [318/325] trfn-v1-fp32-512x512-1x-ox.tz2
if exist "%DEST%\trfn-v1-fp32-512x512-1x-ox.tz2" goto SKIP_0318
curl -L --fail --retry 3 -o "%DEST%\trfn-v1-fp32-512x512-1x-ox.tz2" "%BASE_URL%/trfn-v1-fp32-512x512-1x-ox.tz2"
goto NEXT_0318
:SKIP_0318
echo Already exists. Skipping.
:NEXT_0318
echo.

echo [319/325] txtdtx-v1-fp16-640x960-1x-ox.tz
if exist "%DEST%\txtdtx-v1-fp16-640x960-1x-ox.tz" goto SKIP_0319
curl -L --fail --retry 3 -o "%DEST%\txtdtx-v1-fp16-640x960-1x-ox.tz" "%BASE_URL%/txtdtx-v1-fp16-640x960-1x-ox.tz"
goto NEXT_0319
:SKIP_0319
echo Already exists. Skipping.
:NEXT_0319
echo.

echo [320/325] txtdtx-v1-fp16-640x960-1x-ox.tz2
if exist "%DEST%\txtdtx-v1-fp16-640x960-1x-ox.tz2" goto SKIP_0320
curl -L --fail --retry 3 -o "%DEST%\txtdtx-v1-fp16-640x960-1x-ox.tz2" "%BASE_URL%/txtdtx-v1-fp16-640x960-1x-ox.tz2"
goto NEXT_0320
:SKIP_0320
echo Already exists. Skipping.
:NEXT_0320
echo.

echo [321/325] txtdtx-v1-fp16-640x960-1x-rev2-ox.tz2
if exist "%DEST%\txtdtx-v1-fp16-640x960-1x-rev2-ox.tz2" goto SKIP_0321
curl -L --fail --retry 3 -o "%DEST%\txtdtx-v1-fp16-640x960-1x-rev2-ox.tz2" "%BASE_URL%/txtdtx-v1-fp16-640x960-1x-rev2-ox.tz2"
goto NEXT_0321
:SKIP_0321
echo Already exists. Skipping.
:NEXT_0321
echo.

echo [322/325] wbc-v1-fp16-128x128-ov.tz2
if exist "%DEST%\wbc-v1-fp16-128x128-ov.tz2" goto SKIP_0322
curl -L --fail --retry 3 -o "%DEST%\wbc-v1-fp16-128x128-ov.tz2" "%BASE_URL%/wbc-v1-fp16-128x128-ov.tz2"
goto NEXT_0322
:SKIP_0322
echo Already exists. Skipping.
:NEXT_0322
echo.

echo [323/325] wbc-v1-fp16-128x128-ox.tz2
if exist "%DEST%\wbc-v1-fp16-128x128-ox.tz2" goto SKIP_0323
curl -L --fail --retry 3 -o "%DEST%\wbc-v1-fp16-128x128-ox.tz2" "%BASE_URL%/wbc-v1-fp16-128x128-ox.tz2"
goto NEXT_0323
:SKIP_0323
echo Already exists. Skipping.
:NEXT_0323
echo.

echo [324/325] wbc-v1-fp32-128x128-ox.tz2
if exist "%DEST%\wbc-v1-fp32-128x128-ox.tz2" goto SKIP_0324
curl -L --fail --retry 3 -o "%DEST%\wbc-v1-fp32-128x128-ox.tz2" "%BASE_URL%/wbc-v1-fp32-128x128-ox.tz2"
goto NEXT_0324
:SKIP_0324
echo Already exists. Skipping.
:NEXT_0324
echo.

echo [325/325] WhiteBalanceData-v2.bin
if exist "%DEST%\WhiteBalanceData-v2.bin" goto SKIP_0325
curl -L --fail --retry 3 -o "%DEST%\WhiteBalanceData-v2.bin" "%BASE_URL%/WhiteBalanceData-v2.bin"
goto NEXT_0325
:SKIP_0325
echo Already exists. Skipping.
:NEXT_0325
echo.

echo ===========================================
echo Started : %STARTTIME%
echo Finished: %TIME%
echo Files   : 325
echo ===========================================
echo   Topaz Model 1.0.2 Downloader Complete
echo       Folder: %CD%
echo          Thank Github 91ajames
echo.
echo       Topaz-Offline-Mirror-Server
echo.
echo               Preservation
echo ===========================================
pause
