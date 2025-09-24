@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xelab  -wto caa22ccfc74c412c871e3b77282af991 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_somador_2bits_behav xil_defaultlib.tb_somador_2bits -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
