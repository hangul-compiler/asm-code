ascii_to_int:
    mov edx, 0
    div ecx
    add dl, '0'`
    dec ebx
    mov [ebx], dl
    test eax, eax
    jnz ascii_to_int
