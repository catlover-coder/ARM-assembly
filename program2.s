.global _start

_start:

    @=========================
    @ Bitwise Operations
    @=========================

    MOV R0, #0xFF          @ R0 = 255
    MOV R1, #22            @ R1 = 22

    AND R2, R0, R1         @ Bitwise AND
    ORR R2, R0, R1         @ Bitwise OR
    EOR R2, R0, R1         @ Bitwise XOR

    MOV R3, #0xAA          @ Load 0xAA
    MVN R3, R3             @ Bitwise NOT
    ADD R3, R3, #0x000000FF @ not letting other hex bits to be negated/NOT
    @rather only showing the two negated hex bits result 

    @=========================
    @ Exit Program
    @=========================

    MOV R0, #0             @ Exit status
    MOV R7, #1             @ Exit syscall
    SWI #0                 @ Terminate program
