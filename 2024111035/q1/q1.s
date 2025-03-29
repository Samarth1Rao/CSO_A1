// ASSUMPTIONS:
// 1. All elements arr[i] abide by 0<arr[i]<10001
// 2. Every input will have a valid lonely element (will output -1 otherwise)

.global q1
q1:
    # the below are callee save registers
    # if ur function (like q5) modifies certain registers, you must restore before returning, otherwise you will encounter error
    pushq %rbx
    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    # Initialize parameters
    movq %rdi, %r12 # r12 = arr

    # Get n from arr[0]
    movq (%r12), %r13 # r13 = n

    # Calculate size = 3*n + 1
    movq %r13, %r14
    imulq $3, %r14
    addq $1, %r14 # r14 = size = 3*n + 1

    # Allocate space for frequency array on stack
    # Assuming numbers range from 0 to 10000
    subq $80008, %rsp # 10001 * 8 bytes = 80008 bytes for frequency array

    # Initialize frequency array to zeros
    movq $0, %rcx # i = 0

.loop1:
    cmpq $10001, %rcx
    jge .l1done
    movq $0, (%rsp,%rcx,8) # freq[i] = 0
    incq %rcx
    jmp .loop1

.l1done:
    # Count frequencies start from 1
    movq $1, %rcx # i = 1

.loop2:
    cmpq %r14, %rcx
    jg .l2done # if i > size, exit loop

    # Get arr[i]
    movq (%r12,%rcx,8), %rbx

    # Optional: Bounds check (defensive, can be skipped if inputs are guaranteed)
    cmpq $10000, %rbx
    ja .skip_invalid # skip if arr[i] > 10000

    # Increment freq[arr[i]]
    incq (%rsp,%rbx,8)

.skip_invalid:
    incq %rcx
    jmp .loop2

.l2done:
    # Find the number with frequency 1
    movq $0, %rcx # i = 0

.loop3:
    cmpq $10001, %rcx
    jge .l3nd

    # Check if freq[i] == 1
    cmpq $1, (%rsp,%rcx,8)
    jne .l3continue

    # Found the unique number
    movq %rcx, %rax    # return i
    jmp .cleanup

.l3continue:
    incq %rcx
    jmp .loop3

.l3nd:
    movq $-1, %rax     # return -1 (error case)

.cleanup:
    addq $80008, %rsp

    # Restore callee-saved registers
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    popq %rbx
    ret
