.global add_numbers

.text

add_numbers:
    @ R0 = first number
    @ R1 = second number

    ADD R0, R0, R1    @ R0 = R0 + R1
    BX LR             @ Return to C++

