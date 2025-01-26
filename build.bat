
::@echo off
prompt xiaolaba $g$s
@echo.
@echo Compiling main.c for HC908QT2 using SDCC-M08...
@echo by xiaolaba 2025-JAN-26, testing done



:: Set the path to SDCC (if not already in system PATH)
:: ### SDCC download
:: https://sdcc.sourceforge.net/index.php#Download  
:: sdcc-4.4.0-setup.exe  
:: installed path,  
:: C:\Program Files (x86)\SDCC
set SDCC_PATH="C:\Program Files (x86)\SDCC"
set PATH=%SDCC_PATH%;%PATH%



:: Compile the source code
sdcc -c -mhc08 --stack-auto main.c 
 

:: Link the object file into a HEX file
sdcc -mhc08 --code-loc 0xE800 -o pwm_output.s19 main.rel  


:: Check if the HEX file was generated
if exist pwm_output.s19 (
    @echo Compilation successful! HEX file: pwm_output.hex
) else (
    @echo Compilation failed! Check for errors.
)


mkdir output
move *.cdb .\output\
move *.lk  .\output\
move *.lst .\output\
move *.map .\output\
move *.rel .\output\
move *.rst .\output\
move *.sym .\output\
move *.asm .\output\

