.global q5
q5:
    # the below are callee save registers
    # if ur function (like q5) modifies certain registers, you must restore before returning, otherwise you will encounter error
    pushq %rbx
    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15
	
    movq %rdi, %r12 # r12=arr
    movq %rsi, %r13 # r13=n
    movq %rdx, %r14 # r14=answer
    movq $1, %r8    # prod=1
    movq $0, %r9    # zero_count=0
    movq $0, %rcx   # i=0
   
.loop1: # to find number of zero elements & calculate product
    cmpq %r13, %rcx
    jge .loop1_katham
    movq (%r12,%rcx,8), %rax # Load arr[i] to rax
    testq %rax, %rax
    jz .zero_found
    imulq %rax, %r8
    jmp .loop1continue

.zero_found:
    incq %r9

.loop1continue:
    incq %rcx
    jmp .loop1

.loop1_katham:
    movq $0, %rcx

.loop2:
    cmpq %r13, %rcx
    jge .done # i>=n so loop done
    movq (%r12,%rcx,8), %rax # arr[i] moves to rax
    cmpq $0, %rax
    jz .handle_zero
    cmpq $0, %r9
    jg .store_zero
    movq $0, %rdx
    movq %r8, %rax
    cqo # Sign-extend for division
    idivq (%r12,%rcx,8)  # prod / arr[i]
    movq %rax, (%r14,%rcx,8)
    jmp .loop2continue

.store_zero:
    movq $0, (%r14,%rcx,8)
    jmp .next2

.handle_zero:
    cmpq $1, %r9
    jne .store_zero # if count_zero>1, everything will be zero 
    movq %r8, (%r14,%rcx,8)

.loop2continue:
.next2:
    incq %rcx
    jmp .loop2

.done:
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    popq %rbx
    ret
    