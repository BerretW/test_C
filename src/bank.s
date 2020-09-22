; ---------------------------------------------------------------------------
; bank.s
; ---------------------------------------------------------------------------
;
; Wait for interrupt and return

.export  _switch_bank
BANK_REG = $CE00

; ---------------------------------------------------------------------------
; Wait for interrupt:  Forces the assembler to emit a WAI opcode ($CB)
; ---------------------------------------------------------------------------

.segment  "CODE"

.proc _switch_bank: near

           CLI                    ; Enable interrupts
           STA BANK_REG
           RTS                    ; Return to caller

.endproc
