from pathlib import Path

VERSION = "BETA 1.0.3"
VERSION_FILE = VERSION.replace(" ", "_")

SOURCE_FOLDER = Path(r"C:\TopazMirror\v1")
DEST = r"C:\TopazMirror\v1"
MIRROR_ROOT = r"C:\TopazMirror"
BASE_URL = "http://models.topazlabs.com/v1"
OUT_BAT = Path(fr"C:\TopazMirror\Topaz_Model_Downloader_{VERSION_FILE}.bat")

EXTENSIONS = (".bin", ".data", ".pb", ".txt", ".tz", ".tz2", ".yaml")

if not SOURCE_FOLDER.exists():
    raise FileNotFoundError(f"Source folder does not exist: {SOURCE_FOLDER}")

files = sorted(
    [
        p for p in SOURCE_FOLDER.iterdir()
        if p.is_file() and p.name.lower().endswith(EXTENSIONS)
    ],
    key=lambda x: x.name.lower()
)

total = len(files)

def safe_echo(text: str) -> str:
    return (
        text.replace("^", "^^")
            .replace("&", "^&")
            .replace("|", "^|")
            .replace("<", "^<")
            .replace(">", "^>")
            .replace("(", "^(")
            .replace(")", "^)")
    )

with OUT_BAT.open("w", encoding="utf-8", newline="\r\n") as f:
    f.write("@echo off\n")
    f.write(f"title Topaz Model Downloader - {VERSION}\n")
    f.write("color 0A\n")
    f.write("setlocal DisableDelayedExpansion\n")
    f.write('set "STARTTIME=%TIME%"\n')
    f.write(f'set "DEST={DEST}"\n')
    f.write(f'set "MIRROR_ROOT={MIRROR_ROOT}"\n')
    f.write(f'set "BASE_URL={BASE_URL}"\n\n')

    f.write("echo ===========================================\n")
    f.write("echo         Topaz Model Downloader\n")
    f.write(f"echo             {VERSION}\n")
    f.write("echo ===========================================\n")
    f.write("echo.\n\n")

    f.write('if not exist "%MIRROR_ROOT%" mkdir "%MIRROR_ROOT%"\n')
    f.write('if not exist "%DEST%" mkdir "%DEST%"\n')
    f.write('if not exist "%MIRROR_ROOT%\\_test" mkdir "%MIRROR_ROOT%\\_test"\n')
    f.write('if not exist "%MIRROR_ROOT%\\1.1" mkdir "%MIRROR_ROOT%\\1.1"\n')
    f.write('if not exist "%DEST%\\track" mkdir "%DEST%\\track"\n\n')

    f.write('if not exist "%MIRROR_ROOT%\\_test\\models-bal-test.txt" echo Connected!>"%MIRROR_ROOT%\\_test\\models-bal-test.txt"\n')
    f.write('if not exist "%MIRROR_ROOT%\\1.1\\test.txt" echo Connected!>"%MIRROR_ROOT%\\1.1\\test.txt"\n')
    f.write('if not exist "%DEST%\\track\\OK.txt" echo OK>"%DEST%\\track\\OK.txt"\n\n')

    f.write('cd /d "%DEST%"\n')
    f.write("echo Download folder:\n")
    f.write("echo %CD%\n")
    f.write("echo.\n\n")

    f.write("echo Checking network...\n")
    f.write('netsh interface show interface | findstr /i "Connected" >nul\n')
    f.write("if errorlevel 1 goto NO_ADAPTER\n")
    f.write('curl --silent --head --connect-timeout 5 "%BASE_URL%/" >nul 2>&1\n')
    f.write("if errorlevel 1 goto NO_INTERNET\n")
    f.write("echo [ONLINE] Internet detected.\n")
    f.write("goto START_DOWNLOAD\n\n")

    f.write(":NO_ADAPTER\n")
    f.write("echo [OFFLINE] No Ethernet or Wi-Fi adapter connected.\n")
    f.write("goto START_DOWNLOAD\n\n")

    f.write(":NO_INTERNET\n")
    f.write("echo [OFFLINE] Adapter connected, but Internet unavailable.\n")
    f.write("goto START_DOWNLOAD\n\n")

    f.write(":START_DOWNLOAD\n")
    f.write("echo.\n")
    f.write("echo ===========================================\n")
    f.write("echo          Network check complete.\n")
    f.write("echo      Starting download in 3 seconds...\n")
    f.write("echo ===========================================\n")
    f.write("timeout /t 3 /nobreak >nul\n")
    f.write("echo.\n\n")

    for i, file in enumerate(files, start=1):
        name = file.name
        label = f"SKIP_{i:04d}"

        f.write(f"echo [{i}/{total}] {safe_echo(name)}\n")
        f.write(f'if exist "%DEST%\\{name}" goto {label}\n')
        f.write(f'curl -L --fail --retry 3 -o "%DEST%\\{name}" "%BASE_URL%/{name}"\n')
        f.write(f"goto NEXT_{i:04d}\n")
        f.write(f":{label}\n")
        f.write("echo Already exists. Skipping.\n")
        f.write(f":NEXT_{i:04d}\n")
        f.write("echo.\n\n")

    f.write("echo ===========================================\n")
    f.write("echo Started : %STARTTIME%\n")
    f.write("echo Finished: %TIME%\n")
    f.write(f"echo Files   : {total}\n")
    f.write("echo ===========================================\n")
    f.write("echo   Topaz Model Downloader Complete\n")
    f.write(f"echo           {VERSION}\n")
    f.write("echo     Folder: %CD%\n")
    f.write("echo.\n")
    f.write("echo    Topaz-Offline-Download-Server\n")
    f.write("echo.\n")
    f.write("echo           Preservation\n")
    f.write("echo.\n")
    f.write("echo       Thank Github 91ajames\n")
    f.write("echo ===========================================\n")
    f.write("pause\n")

print(f"Created: {OUT_BAT}")
print(f"Files added: {total}")

input("\nPress Enter to exit...")
