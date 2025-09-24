@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xelab  -wto e8ce4a7e2091432b8235f6bba0e54f1b -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_detector_11010_behav xil_defaultlib.tb_detector_11010 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
