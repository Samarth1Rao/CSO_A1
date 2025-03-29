.global rotate

rotate:
	cmpq $2, %rsi
	jl .return_early
	
	movq %rsi, %rcx
	subq $2, %rcx
	movq (%rdi,%rcx,8), %rax
	incq %rcx
	movq (%rdi,%rcx,8), %rdx
	movq %rsi, %rcx
	subq $3, %rcx

	
.loop_start:
	cmpq $-1, %rcx 
	jl .loop_done 
	movq (%rdi,%rcx,8), %r8
	movq %r8, 16(%rdi,%rcx,8)
	decq %rcx
	jmp .loop_start

	
.loop_done:
	movq %rax, (%rdi)
	movq %rdx, 8(%rdi)
	ret
	
	
.return_early: 
	ret
