BITS 64

section .text
;global ft_strlen
;ft_strlen:
;	xor rax, rax
;	xor ch, ch
;.LOOP:
;	mov ch, [rdi + rax]
;	inc rax
;	cmp ch, 0
;	jne .LOOP
;	dec rax
;	ret

;https://www.gladir.com/LEXIQUE/ASM/repnz.htm

global ft_strlen
ft_strlen:
	xor rcx, rcx
	not rcx; set rcx to -1

	xor al, al; set al to 0

	repnz scasb; repeat until zeroflag is set to 1 the scab operation scan and compare al with rdi if null set zeroflag to 1 and interrupt the repetition
	not rcx
	dec rcx
	mov rax, rcx
	ret
