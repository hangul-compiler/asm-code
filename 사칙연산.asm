section .data
    abc db 0, 0, 0, 0, 0

section .text
    global _start

_start:
    push 300
    push 2
    call cal_div
    
    mov [abc], eax

    mov ecx, 10
    mov ebx, abc
    add ebx, 4

divide_loop:
    mov edx, 0
    div ecx
    add dl, '0'
    dec ebx
    mov [ebx], dl
    test eax, eax
    jnz divide_loop

    mov rax, 1      
    mov rdi, 1      
    mov rsi, rbx    
    mov rdx, 5 
    syscall         

    mov rax, 60     
    xor rdi, rdi    
    syscall 

cal_sum:
    ; 스택 프레임 구성
    push rbp          ; Save the old base pointer
    mov rbp, rsp      ; Set the new base pointer

    ; 함수 인자 로딩 및 덧셈 수행
    mov eax, [rbp+24] ; Load a from the stack (rbp+8의 64비트 버전)
    add eax, [rbp+16] ; Add b to eax (rbp+12의 64비트 버전)

    ; 스택 프레임 해제 및 반환
    pop rbp           ; Restore the old base pointer
    ret

cal_sub:
    push rbp 
    mov rbp, rsp

    mov eax, [rbp+24]
    sub eax, [rbp+16]

    pop rbp
    ret

cal_mul:
    push rbp
    mov rbp, rsp

    mov eax, [rbp+16] 
    imul eax, [rbp+24] 

    pop rbp 
    ret

cal_div:
    push rbp
    mov rbp, rsp

    mov ax, [rbp+24] 
    mov bx, [rbp+16]
    div bx

    pop rbp 
    ret