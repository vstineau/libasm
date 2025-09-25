NAME = libasm.a
AS = nasm 
ASFLAGS = -f elf64 -g 
SRCS = 			ft_read.s \
				ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_write.s \
				ft_strdup.s 

SRCS_BONUS =	ft_list_size_bonus.s \
				ft_list_push_front_bonus.s #\
				ft_list_sort_bonus.s \
				ft_list_remove_if_bonnus.s \
				ft_atoi_base_bonus.s 

OBJS_PATH = .obj/
OBJS_NAME = $(SRCS:.s=.o)
OBJS_BONUS_NAME = $(SRCS_BONUS:.s=.o)
OBJS_BONUS = $(addprefix $(OBJS_PATH), $(OBJS_BONUS_NAME))
OBJS = $(addprefix $(OBJS_PATH), $(OBJS_NAME))

$(OBJS_PATH)%.o: %.s
	@mkdir -p $(@D)
	$(AS) $(ASFLAGS) $< -o $@

all: $(NAME) 

test: $(NAME) 
	gcc -o test -Wall -Wextra -Werror main.c libasm.a

$(NAME): $(OBJS) 
	ar -rcs $(NAME) $(OBJS)

clean:
	rm -rf .obj

fclean: clean
	rm -rf $(NAME)
	rm -rf test

re: fclean test

bonus: $(OBJS) $(OBJS_BONUS)
	ar -rcs $(NAME) $(OBJS_BONUS) $(OBJS) 

.PHONY: all clean fclean re bonus

#https://wiki.osdev.org/System_V_ABI
#Parameters registers:  rdi, rsi, rdx, rcx, r8, and r9.
#Return register : rax
#Scratch registers: rax, rdi, rsi, rdx, rcx, r8, r9, r10, r11
#Preserved registers rbx, rsp, rbp, r12, r13, r14, and r15
#int3 interruption debug (put a breakpoint in the code)
#erno_location
#syscall table : https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
