@echo off
setlocal enabledelayedexpansion

set "pngquant_path=C:\pngquant\pngquant.exe"
set "optipng_path=C:\optipng\optipng.exe"
set "exiftool_path=C:\exiftool\exiftool.exe"

for /R %%i in (*.png) do (
    echo Processing file: "%%i"

    "!pngquant_path!" --quality=65-80 --ext .png --force "%%i"

    "!optipng_path!" -o7 "%%i"

		echo Removing metadata with ExifTool: "%%i"
		"!exiftool_path!" -overwrite_original -all= "%%i"
)

echo Optimization complete!
endlocal
pause
