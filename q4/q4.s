.global diffMaxMin

diffMaxMin:
    cmpq $1, %rsi
    jle .ret

    movq (%rdi), %rax
    movq %rax, %rbx

    movq $1, %rcx

.loop_start:
    cmpq %rsi, %rcx
    jge .find_difference

    movq (%rdi,%rcx,8), %rdx

    cmpq %rdx, %rax
    jle .check_max
    movq %rdx, %rax

.check_max:
    cmpq %rdx, %rbx
    jge .inc
    movq %rdx, %rbx

.inc:
    incq %rcx
    jmp .loop_start

.find_difference:
    subq %rax, %rbx
    movq %rbx, %rax
    
.ret:
    ret
