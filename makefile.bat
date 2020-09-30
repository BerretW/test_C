del .\output\*.*
cd .\src
cc65 -t none -O --cpu 6502 main.c
cc65 -t none -O --cpu 6502 GameDuino.c
ca65 --cpu 6502 main.s -o ..\output\main.o
ca65 --cpu 6502 GameDuino.s -o ..\output\GameDuino.o
ca65 --cpu 6502 vectors.s -o ..\output\vectors.o
ca65 --cpu 6502 wait.s -o ..\output\wait.o
ca65 --cpu 6502 bank.s -o ..\output\bank.o
ca65 --cpu 6502 acia.s -o ..\output\acia.o
ca65 --cpu 6502 zeropage.s -o ..\output\zeropage.o
ca65 --cpu 6502 utils.s -o ..\output\utils.o
ca65 --cpu 6502 spi.s -o ..\output\spi.o

cd ..\output
ld65 -C ..\config\APP.cfg -m main.map vectors.o wait.o main.o bank.o acia.o zeropage.o utils.o spi.o GameDuino.o ..\library\p65.lib -o ..\output\ROM.bin
ld65 -C ..\config\bank_ram_disk.cfg -m main.map vectors.o wait.o main.o bank.o acia.o zeropage.o utils.o spi.o GameDuino.o ..\library\p65.lib -o ..\output\BANK.bin
ld65 -C ..\config\APP_RAM_DISK.cfg -m main.map vectors.o wait.o main.o bank.o acia.o zeropage.o utils.o spi.o GameDuino.o ..\library\p65.lib -o ..\output\RAM.bin

del *.o
del *.map
del *.s
