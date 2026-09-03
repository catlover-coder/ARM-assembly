.global _start
.text
_start:

    @===========================
    @ Arrays / Lists
    @===========================

    LDR R0, =list          @ R0 = address of list

    LDR R9, [R0]           @ Load first element
    LDR R8, [R0, #4]       @ Load second element

    @ Other addressing modes:

    @ LDR R8, [R0, #4]!    @ Move to next element, then load
    @ LDR R8, [R0], #4     @ Load current element, then move pointer

    @===========================
    @ Storing values
    @===========================

    MOV R9, #30            @ Value to store
    STR R9, [R0]           @ list[0] = 30

    MOV R0, R9      @ Exit status code (0 = success)
    MOV R7, #1      @ Linux 32-bit exit system call number
    SWI #0

.data

list:
    .word 10, 14, -15, -16

