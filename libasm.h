#pragma once

#include <stddef.h>
#include <unistd.h>

//MANDATORY
size_t	ft_strlen(const char *);
char	*ft_strcpy(char *dest, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(const char *s);


typedef struct s_list
{
	void			*content;
	struct s_list	*next;
}					t_list;

//BONUS

int		ft_list_size(t_list *lst);
void	ft_list_push_front(t_list **begin_list, void *data);
