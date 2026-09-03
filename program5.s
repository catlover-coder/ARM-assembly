.global _start

_start:

    MOV R0, #1          @ Put 1 into R0
    MOV R1, #3          @ Put 3 into R1

    PUSH {R0, R1}       @ Save R0 and R1 on the stack

    BL get_value        @ Call the function

    POP {R0, R1}        @ Restore R0 and R1 from the stack

    B end               @ Go to the end of the program


get_value:

    MOV R0, #5          @ Put 5 into R0
    MOV R1, #7          @ Put 7 into R1
    ADD R2, R0, R1      @ Add R0 and R1, store the answer in R2

    BX lr               @ Return to the place where the function was called


end:

    MOV R0, R2          @ Exit code 0 (success)
    MOV R7, #1          @ Linux syscall number for exit
    SVC #0              @ Ask the operating system to end the program
