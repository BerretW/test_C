#include <stdlib.h>
#include <stdio.h>

extern void __fastcall__ switch_bank (int);
extern void wait();
int i = 0;

int main () {
  while (1) {
      ++i;
      wait();                                   //  Run forever
      switch_bank(i);                                    //  Discard any other RX characters
      if (i == 250) i = 0;
  }

  return (0);                                     //  We should never get here!
}
