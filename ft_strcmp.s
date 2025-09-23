BITS 64

section .text
global ft_strcmp
ft_strcmp:
	xor rax, rax
	xor rdx, rdx
	xor rcx, rcx
	.LOOP:
	mov cl, [rdi + rax]; extract 1 byte of s1 (rdi is first arg)
	mov dl, [rsi + rax]; extract 1 byte of s2 (rsi is second arg) 
	cmp cl, 0
	je .END
	cmp dl, 0
	je .END
	inc rax; use rax as increment 
	cmp cl, dl; compare the two bytes extracted
	je .LOOP
	.END:
	mov rax, rcx; mov s1 byte in rax 
	sub rax, rdx; sub s2byte to s1 byte in rax
	ret
