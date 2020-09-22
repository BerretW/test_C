del .\output\*.*
cd .\src
cc65 -t none -O --cpu 65c02 main.c
ca65 --cpu 65c02 main.s -o ..\output\main.o
ca65 --cpu 65c02 vectors.s -o ..\output\vectors.o
ca65 --cpu 65c02 wait.s -o ..\output\wait.o
ca65 --cpu 65c02 bank.s -o ..\output\bank.o

cd ..\output
ld65 -C ..\config\APP.cfg -m main.map vectors.o wait.o main.o bank.o ..\library\p65.lib -o ..\output\ROM.bin
ld65 -C ..\config\bank_ram_disk.cfg -m main.map vectors.o wait.o main.o bank.o ..\library\p65.lib -o ..\output\BANK.bin
ld65 -C ..\config\APP_RAM_DISK.cfg -m main.map vectors.o wait.o main.o bank.o ..\library\p65.lib -o ..\output\RAM.bin

del *.o
del *.map
del *.s
