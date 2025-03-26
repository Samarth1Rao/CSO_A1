.global isPalindrome

isPalindrome:

    pushq %rbp
    movq %rsp, %rbp
    
    # %rdi contains the address of the string
    # %rsi contains the length of the string 
    
    movq $0, %rcx
    
.palindrome_loop:
    movq %rsi, %rax
    shrq $1, %rax # len/2, because we are doing right shift 1, which is nothing but divided by 2
    cmpq %rax, %rcx # we are comparing if the value in rax (len/2) is equal to value in rcx (i)
    jge .is_palindrome # if we go through the full loop and fail to find a 'bad pair,' then we want to return true, so we call .is_palindrome
    
    movb (%rdi, %rcx, 1), %r8b # str[i]
    
    movq %rsi, %rax
    subq %rcx, %rax # len-i
    decq %rax # len-i-1
    
    movb (%rdi, %rax, 1), %r9b # str[len-i-1], it is a String based question so we can use movb bc everything is only 1 byte
    
    # Compare str[i] and str[n-i-1]
    cmpb %r8b, %r9b
    jne .not_palindrome # If they dont match, its not a palindrome
    
    # Increment i
    incq %rcx
    jmp .palindrome_loop
    
.is_palindrome:
    movq $1, %rax
    jmp .end # Not having this line wasted 1hr of my life and sanity
    
.not_palindrome:
    movq $0, %rax
    
.end:
    movq %rbp, %rsp
    popq %rbp
    ret
