.global _start

_start:

    @==========================================
    @ LSL (Logical Shift Left)
    @==========================================
    MOV R0, #5
    MOV R8, R0, LSL #1  @ R8 = 10
    LSL R2, R0, #2      @ R2 = 20

    @==========================================
    @ LSR (Logical Shift Right)
    @==========================================
    MOV R3, #20         @ R3 = 20
    LSR R4, R3, #1      @ R4 = 10
    LSR R5, R3, #2      @ R5 = 5

    @==========================================
    @ CMP + BGT
    @==========================================
    MOV R0, #15
    MOV R1, #10
    CMP R0, R1
    BGT GREATER         @ Jump if R0 > R1

    @==========================================
    @ CMP + BGE
    @==========================================
    MOV R0, #10
    MOV R1, #10
    CMP R0, R1
    BGE GREATER_EQUAL   @ Jump if R0 >= R1

    @==========================================
    @ CMP + BLT
    @==========================================
    MOV R0, #5
    MOV R1, #10
    CMP R0, R1
    BLT LESS            @ Jump if R0 < R1

    @==========================================
    @ CMP + BLE
    @==========================================
    MOV R0, #10
    MOV R1, #10
    CMP R0, R1
    BLE LESS_EQUAL      @ Jump if R0 <= R1

    @==========================================
    @ CMP + BEQ
    @==========================================
    MOV R0, #25
    MOV R1, #25
    CMP R0, R1
    BEQ EQUAL           @ Jump if equal

    @==========================================
    @ CMP + BNE
    @==========================================
    MOV R0, #7
    MOV R1, #9
    CMP R0, R1
    BNE NOT_EQUAL       @ Jump if not equal

    @==========================================
    @ BAL (Branch Always)
    @==========================================
    BAL END             @ Always jumps to END


GREATER:
    MOV R6, #1
    BAL END

GREATER_EQUAL:
    MOV R6, #2
    BAL END

LESS:
    MOV R6, #3
    BAL END

LESS_EQUAL:
    MOV R6, #4
    BAL END

EQUAL:
    MOV R6, #5
    BAL END

NOT_EQUAL:
    MOV R6, #6
    BAL END


END:
    MOV R7, #1          @ Exit (Linux ARM)
    SWI 0

