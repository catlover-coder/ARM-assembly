.global _start

.section .text

_start:
    mov r0, #7              @ first argument
    mov r1, #5              @ second argument

    bl add_numbers          @ call function
                            @ LR gets return address
                            @ PC jumps to add_numbers

    mov r4, r0              @ save returned result

    mov r7, #1              @ Linux ARM32 sys_exit
    mov r0, r4              @ exit status = result
    svc #0


add_numbers:
    push {r4, lr}           @ save r4 and LR on stack
                            @ SP moves downward

    sub sp, sp, #4          @ reserve 4 bytes of stack space

    add r0, r0, r1          @ r0 = r0 + r1
                            @ 7 + 5 = 12

    str r0, [sp]            @ store result on stack

    ldr r4, [sp]            @ load result from stack into r4

    add sp, sp, #4          @ release local stack space

    mov r0, r4              @ return value in r0

    pop {r4, lr}            @ restore r4 and original LR

    mov pc, lr              @ PC = LR → return to caller
