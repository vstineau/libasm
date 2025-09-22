BITS 64

;syscall table : https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/

extern __errno_location

global ft_read
ft_read:
	mov rax, 0; set rax to 1 because syscall write is index 1 in syscall table
	syscall; call syscall sys_write because we set rax to 1

	cmp rax, 0
	jl .ERROR
	ret

	.ERROR:
	mov rdx, rax; save rax
	call __errno_location wrt ..plt
	
	neg edx; pass the value of erno from negaive value to positive value  
	mov [rax], edx; set erno with the right value
 
	xor rax, rax
	not rax; after we set errno we set the return value to -1
	ret
