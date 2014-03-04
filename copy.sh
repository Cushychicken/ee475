#/bin/bash

CODE_PATH="/Users/nreilly/Desktop/projects/ee475/Lab/lab0%d/DE2_System/nios_qsys/software/*/*.h"
VHDL_PATH="/Users/nreilly/Desktop/projects/ee475/Lab/lab0%d/DE2_System/*.vhd"

CODE_DEST="/Users/nreilly/Desktop/projects/ee475/lab0%d/code/"
VHDL_DEST="/Users/nreilly/Desktop/projects/ee475/lab0%d/vhdl/"

for i in {1..7}
do 
	src=$(printf "$CODE_PATH" $i)
	dst=$(printf "$CODE_DEST" $i)
	ls -al $src
	$(cp $src $dst)
done
