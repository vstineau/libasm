NAME = liasm.a
CC = nasm 
CFLAGS = -Wall -Wextra -Werror 
SRCS = 			ft_read.s \
				ft_strlen.s \
				ft_strcpy.s \
				ft_strlcpy.s \
				ft_strcmp.s \
				ft_strdup.s 

SRCS_BONUS =	ft_list_push_front_bonus.s \
				ft_list_size_bonus.s \
				ft_list_sort_bonus.s \
				ft_list_remove_if_bonnus.s \
				ft_atoi_base_bonus.s 

OBJS = $(SRCS:.s=.o)
OBJS_BONUS = $(SRCS_BONUS:.s=.o)



all: $(NAME)

$(NAME): $(OBJS) 
	ar -rcs $(NAME) $(OBJS)

%.o: %.s
	$(CC) $(CFLAGS) $<

clean:
	rm -rf $(OBJS) $(OBJS_BONUS)

fclean: clean
	rm -rf $(NAME)

re: fclean all

bonus: $(OBJS) $(OBJS_BONUS)
	ar -rcs $(NAME) $(OBJS_BONUS) $(OBJS) 

.PHONY: all clean fclean re
