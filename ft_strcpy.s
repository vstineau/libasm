BITS 64

section .text
global ft_strcpy
ft_strcpy:
	xor rax, rax,
	.LOOP:
	mov dl, [rsi + rax]; mov 1 byte of src (rsi is second arg) 
	mov [rdi + rax], dl;mov in dest (rdi is first arg) the byte read from src

	inc rax; use rax as increment 
	cmp dl, 0; if byte red is not null 
	jne .LOOP;  loop again

	mov rax, rdi; mov dest in rax (register for return value)
	ret

