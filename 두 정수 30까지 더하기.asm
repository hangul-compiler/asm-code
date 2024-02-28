section .data
    abc db 0, 0, 0, 0, 0

section .text
    global _start

_start:
    push 20
    push 2
    call sum_until_30
    mov [abc], eax

    mov ecx, 10
    mov ebx, abc
    add ebx, 4

ascii_to_int:
    mov edx, 0
    div ecx
    add dl, '0'
    dec ebx
    mov [ebx], dl
    test eax, eax
    jnz ascii_to_int

    mov rax, 1      
    mov rdi, 1      
    mov rsi, rbx    
    mov rdx, 5 
    syscall         

    mov rax, 60     
    xor rdi, rdi    
    syscall 

sum_until_30:
    push rbp
    mov rbp, rsp
    
    mov eax, [rbp+24]
    mov ebx, [rbp+16]
    
    loop_sum:
        add eax, ebx
        cmp eax, 30 ; 결과값이 30이면 종료
        je loop_sum_end

    jnz loop_sum ; 결과값이 30이 아니면 loop_start 다시 수행

    loop_sum_end:
        pop rbp
        ret
