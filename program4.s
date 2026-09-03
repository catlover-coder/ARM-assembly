.global _start

@ Define a constant marker (0xAAAAAAAA) to signal the end of the array
.equ endlist, 0xaaaaaaaa

_start:
    LDR R0, =list     @ R0 = memory address of the first item in the list
    LDR R3, =endlist  @ R3 = end marker value (0xAAAAAAAA)
    
    LDR R1, [R0]      @ Load the first value from list into R1 (R1 = 1)
    ADD R2, R2, R1    @ Add the first value (R1) to running total in R2

loop:
    LDR R1, [R0, #4]! @ Move pointer R0 forward by 4 bytes FIRST, then load new value into R1
    CMP R1, R3        @ Compare the current value (R1) against the end marker (R3)
    BEQ exit          @ If R1 matches the marker (0xAAAAAAAA), exit the loop
    
    ADD R2, R2, R1    @ Add the current value (R1) to the running total in R2
    BAL loop          @ Branch always back to 'loop'

exit:
    @ Program completes. Total sum of numbers 1 to 10 will be in R2 (55 / 0x37).
    mov r0, r2          @ Return result
    mov r7, #1          @ Syscall number 1 = sys_exit
    swi 0               @ Software interrupt (or 'svc 0')

.data
list:
    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

