BITS 64

extern malloc
;void ft_list_push_front(t_list **begin_list, void *data);
section .text
global ft_list_push_front
ft_list_push_front:
	push rbx
	push r12
	push rdi; push **begin_list on stack to save him
	xor rbx, rbx
	xor r12, r12
	xor rdx, rdx
	mov rbx, [rdi];save the *begin_list in rbx
	mov r12, rsi; save data in r12

	mov rdi, 16
	call malloc wrt ..plt
	test rax, rax
	je .ERROR
	
	pop rdi; get back **begin_list
	mov [rax], r12; set the data in int he new allocated node
	mov [rax + 8], rbx; set the ->next of th newallocated node
	mov [rdi], rax; *begin_list = newNode

	pop r12
	pop rbx
	ret

.ERROR:
	pop r12
	pop rbx
	ret
