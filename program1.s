.global _start

_start:
    MOV  R0, #0xF0      @ 240
    MOV  R1, #0xC7      @ 199

    @--------------------------
    @ Addition
    @--------------------------
    ADD   R2, R0, R1    @ Add
    ADDS  R2, R0, R1    @ Add and update flags
    ADC   R2, R0, R1    @ Add with Carry

    @--------------------------
    @ Subtraction
    @--------------------------
    SUB   R2, R1, R0    @ Subtract
    SUBS  R2, R1, R0    @ Subtract and update flags
    SBC   R2, R1, R0    @ Subtract with Borrow (Carry flag)

    @--------------------------
    @ Multiplication
    @--------------------------
    MUL   R2, R0, R1    @ Multiply
    MULS  R2, R0, R1    @ Multiply and update flags

    MOV R7, #1
    SWI #0
