PORTA_DATA = $CE10
PORTA_DDR = $CE20

.export _digitalWrite
.export _pinMode
.code

.proc _digitalWrite: near

           CLI                    ; Enable interrupts
           STA PORTA_DATA
           RTS                    ; Return to caller

.endproc

.proc _pinMode: near

           CLI                    ; Enable interrupts
           STA PORTA_DDR
           RTS                    ; Return to caller

.endproc
