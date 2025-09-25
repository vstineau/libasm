BITS 64

extern malloc

section .text
global ft_strdup
ft_strdup:
	push rbx; preserved register
	mov rbx, rdi; save the parameter before calling malloc AND rpnz because rpnz advance the rdi pointer lol
	xor rcx, rcx
	not rcx; set rcx to -1

	xor al, al; set al to 0

	repnz scasb; repeat until zeroflag is set to 1 the scab operation scan and compare al with rdi if null set zeroflag to 1 and interrupt the repetition
	not rcx
	mov rdi, rcx; set rdi with the parameter of malloc function which is the result of the strlen above 
	
	call malloc wrt ..plt
	cmp rax, 0; if malloc failed jump to ERROR and return null too
	je .ERROR
	xor r8, r8
	xor rsi, rsi
.LOOP:
	mov r8b, [rbx + rsi]; exctract one byte from str
	mov [rax + rsi], r8b; move the byte to allocated string in rax
	inc rsi; use rsi as increment
	cmp r8b, 0
	jne .LOOP
	pop rbx
	ret 

.ERROR:
	pop rbx
	ret
