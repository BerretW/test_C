#include <stdlib.h>
#include <stdio.h>

#include "acia.h"
#include "bank.h"
#include "wait.h"
#include "spi.h"
#include "utils.h"
#include "GameDuino.h"


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
gd_backc(20);

  while (1) {
    c = acia_getc();
    gd_putc(c);
    //wait_s();
    acia_putc(c);
    c = gd_getc();
    acia_putc(c);

  }
  return (0);
}
