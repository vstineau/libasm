BITS 64

;syscall table : https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/

extern __errno_location

BITS 64

extern __errno_location

section .text
global ft_read
ft_read:
	mov rax, 0; set rax to 0 because syscall write is index 0 in syscall table
	syscall; call syscall sys_write because we set rax to 0

	cmp rax, 0
	jl .ERROR
	ret

	.ERROR:
	push rbx; save rbx on stack because it's a preserve register
	xor rbx, rbx; set rbx to 0
	mov rbx, rax; save rax
	call __errno_location wrt ..plt; with respect to procedure linkage which mean it will use the linkege table to find and store the address of the function called
	
	neg ebx; pass the value of erno from negaive value to positive value  
	mov [rax], ebx; set erno with the right value
 
	xor rax, rax
	not rax; after we set errno we set the return value to -1
	pop rbx; restore rbx after use
	ret
