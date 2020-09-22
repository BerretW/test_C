; ---------------------------------------------------------------------------
; bank.s
; ---------------------------------------------------------------------------
;

.export  _switch_bank
BANK_REG = $CE00

.segment  "CODE"

.proc _switch_bank: near

           CLI                    ; Enable interrupts
           STA BANK_REG
           RTS                    ; Return to caller

.endproc
