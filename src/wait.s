; ---------------------------------------------------------------------------
; wait.s
; ---------------------------------------------------------------------------
;
; Wait for interrupt and return

.export  _wait

; ---------------------------------------------------------------------------
; Wait for interrupt:  Forces the assembler to emit a WAI opcode ($CB)
; ---------------------------------------------------------------------------

.segment  "CODE"

.proc _wait: near

delay:
  STA $40  ; save state
  LDA #$00
  STA $41  ; high byte
delayloop:
  ADC #01
  BNE delayloop
  CLC
  INC $41
  BNE delayloop
  CLC
  ; exit
  LDA $40  ; restore state
  RTS
.endproc
