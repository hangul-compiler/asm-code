section .data
    msg db "Hello world!", 0ah

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 13
    mov ebx, 1

print_loop:
    cmp ebx, 10
    je end
    syscall
    mov rax, 1
    inc ebx
    jmp print_loop

end:
    mov rax, 60
    mov rdi, 0
    syscall

