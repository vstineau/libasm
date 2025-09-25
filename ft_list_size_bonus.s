BITS 64

section .text
global ft_list_size
ft_list_size: 
	xor rax, rax; set rax to 0
	cmp rdi, 0
	je .ERROR

.LOOP:
	mov rdi, [rdi + 8] 
	inc rax
	cmp rdi, 0
	jne .LOOP

	ret

.ERROR
	ret
