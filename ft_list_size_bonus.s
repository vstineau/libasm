BITS 64

section .text
global ft_list_size
ft_list_size: 
	xor rax, rax; set rax to 0
	cmp rdi, 0
	je .ERROR

.LOOP:
	mov rdi, [rdi + 8]; current  = current->next 
	inc rax; rax++ to count derectly int the return value register 
	cmp rdi, 0; check if current == NULL
	jne .LOOP

	ret

.ERROR
	ret
