@echo off
title ByteWix Studio Launcher
color 0B
echo ====================================
echo      ByteWix Studio - Launcher
echo ====================================
echo.

if exist "C:\MinGW\mingw64\bin\g++.exe" goto MinGWReady

echo [*] MinGW bulunamadi, indiriliyor (Lutfen bekleyin)...
powershell -Command "New-Item -ItemType Directory -Force -Path 'C:\MinGW' | Out-Null; $url='https://github.com/brechtsanders/winlibs_mingw/releases/download/13.2.0posix-17.0.6-11.0.1-ucrt-r5/winlibs-x86_64-posix-seh-gcc-13.2.0-llvm-17.0.6-mingw-w64ucrt-11.0.1-r5.zip'; $zip='$env:TEMP\mingw.zip'; Invoke-WebRequest -Uri $url -OutFile $zip; Expand-Archive -Path $zip -DestinationPath 'C:\MinGW' -Force; Remove-Item $zip"
echo [OK] MinGW kuruldu!
goto SetPath

:MinGWReady
echo [OK] MinGW (g++) hazir.

:SetPath
set "PATH=C:\MinGW\mingw64\bin;%PATH%"

echo [*] Kutuphaneler kontrol ediliyor...
python -m pip install --upgrade pip --quiet
python -m pip install PyQt6 Pillow PyInstaller --quiet
echo [OK] Kutuphaneler tamam!

echo [*] ByteWix Studio baslatiliyor...
echo ------------------------------------

if not exist "Bytewix.exe" goto NotFound

start "" "Bytewix.exe"
exit

:NotFound
echo [X] Hata: Bytewix.exe dosyasi bulunamadi!
pause