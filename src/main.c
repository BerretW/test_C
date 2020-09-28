#include <stdlib.h>
#include <stdio.h>

#include "acia.h"
#include "bank.h"
#include "wait.h"
#include "spi.h"
#include "utils.h"


int i = 0;
char c = 0;
int main () {
acia_init();
wait();
acia_puts("Ahoj svete, ja jsem Projekt65 SPI");
acia_put_newline();
acia_puts("A mimochodem C je fajn jazyk 2:D");

spiInit();
wait();
  while (1) {
    c = acia_getc();
    acia_putc(c);
    acia_put_newline();

    spiBegin();
    wait();
    spiWrite(0x80);
    spiWrite(0x00);
    spiWrite(c);
    wait();
    spiEnd();

  }
  return (0);
}
