section .data
    msg db "Hello world!", 0ah

section .text
    global _start

_start:
    push 1
    push 2
    call valid_num

valid_num:
    push rbp
    mov rbp, rsp
    
    mov eax, [rbp+24]
    mov ebx, [rbp+16]
    
    cmp eax, ebx 
    jle print ; 먼저 push한 숫자가 더 작으면 "Hello world!" 출력

    pop rbp
    ret

print:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 13
    syscall
        
    mov rax, 60
    mov rdi, 0
    syscall