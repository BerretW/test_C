#include <stdlib.h>
#include <stdio.h>

#include "acia.h"
#include "bank.h"
#include "wait.h"


int i = 0;

int main () {
acia_init();
wait();
acia_puts("Ahoj svete, ja jsem Projekt65");
acia_put_newline();
acia_puts("A mimochodem C je fajn jazyk :D");

  while (1) {
      ++i;
      wait();
      switch_bank(i);
      if (i == 250) i = 0;
  }
  return (0);
}
