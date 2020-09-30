#include "spi.h"
#include "GameDuino.h"
#include "wait.h"

void gd_putc(char c);
char gd_getc();
void gd_backc(int i);


char gd_getc(){
  char c = 0;
  spiBegin();
  spiWrite(0x00);
  spiWrite(0x00);
  wait_s();
  c = spiRead();
  spiEnd();
  return c >> 1;
}


void gd_putc(char c){
  spiBegin();
  spiWrite(0x80);
  spiWrite(0x00);
  spiWrite(c);
  spiEnd();
}

void gd_backc(int i){

  spiBegin();
  spiWrite(0xA8);
  spiWrite(0x0E);
  spiWrite(i);
  spiEnd();
  wait();
  spiBegin();
  spiWrite(0xA8);
  spiWrite(0x0F);
  spiWrite(0x70);
  spiEnd();
}
