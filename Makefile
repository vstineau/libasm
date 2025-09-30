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
				ft_list_push_front_bonus.s

OBJS_PATH = .obj/
OBJS_NAME = $(SRCS:.s=.o)
OBJS_BONUS_NAME = $(SRCS_BONUS:.s=.o)
OBJS_BONUS = $(addprefix $(OBJS_PATH), $(OBJS_BONUS_NAME))
OBJS = $(addprefix $(OBJS_PATH), $(OBJS_NAME))

OBJS_LIB = $(OBJS)

$(OBJS_PATH)%.o: %.s
	@mkdir -p $(@D)
	$(AS) $(ASFLAGS) $< -o $@

all: $(NAME)

bonus: .bonus_built

.bonus_built: $(OBJS) $(OBJS_BONUS)
	ar -rcs $(NAME) $(OBJS_BONUS) $(OBJS)
	touch .bonus_built

$(NAME): $(OBJS)
	ar -rcs $(NAME) $(OBJS)

test: $(NAME)
	gcc -o test -Wall -Wextra -Werror main.c libasm.a

testbonus: $(NAME)
	gcc -o testbonus -Wall -Wextra -Werror main_bonus.c libasm.a

clean:
	rm -rf .obj .bonus_built

fclean: clean
	rm -rf $(NAME) test testbonus

re: fclean test

.PHONY: all clean fclean re bonus test

#https://wiki.osdev.org/System_V_ABI
#Parameters registers:  rdi, rsi, rdx, rcx, r8, and r9.
#Return register : rax
#Scratch registers: rax, rdi, rsi, rdx, rcx, r8, r9, r10, r11
#Preserved registers rbx, rsp, rbp, r12, r13, r14, and r15
#int3 interruption debug (put a breakpoint in the code)
#erno_location
#syscall table : https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
