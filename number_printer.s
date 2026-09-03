.global assembly_start
.extern print_number

.text
.align 4

assembly_start:
    PUSH {LR}

    MOV R0, #99          @ First argument
    BL print_number      @ Call C++ function

    POP {PC}
