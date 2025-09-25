#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>

#include "libasm.h"

t_list	*ft_lstnew(void *content)
{
	t_list	*lstnew;

	lstnew = (t_list *)malloc(sizeof(*lstnew));
	if (!lstnew)
		return (NULL);
	lstnew->content = content;
	lstnew->next = NULL;
	return (lstnew);
}

int main()
{
	{
		printf("_____________________\nTEST FT_STRLEN\n_____________________\n");
		printf("strlen = %zu ------ ft_strlen =%zu\n", strlen("12"),ft_strlen("12"));
	}
	{
		printf("_____________________\nTEST FT_STRCPY\n_____________________\n");
		char dest[100];
		char src[] = "ca marche" ;
		printf("strcpy =%s ------- ft_strcpy=%s\n", strcpy(dest, src), ft_strcpy(dest, src));
	}
	{
		printf("_____________________\nTEST FT_STRCMP\n_____________________\n");
		char s1[] = "sdfsdfr";
		char s2[] = "bonjour";
		printf("strcmp = %d ----- ft_strcmp = %d\n", strcmp(s1, s2), ft_strcmp(s1, s2));
	}
	{
		printf("_____________________\nTEST FT_WRITE\n_____________________\n");
		printf("write = %zd -------- ft_write = %zd\n", write(1, "test\n", 5), ft_write(1, "test\n", 5));
	}
	{
		printf("_____________________\nTEST FT_READ\n_____________________\n");
		char buf1[50];
		char buf2[50];
		bzero(&buf1, 50);
		bzero(&buf2, 50);
		int fd  = open("Makefile", O_RDONLY);
		int fd1  = open("Makefile", O_RDONLY);
		printf("read = %zd and buff1 = %s\n", read(fd, buf1, 49), buf1);
		printf("ft_read = %zd and buff2 = %s\n", ft_read(fd1, buf2, 49), buf2);
		close(fd);
		close(fd1);
	}
	{
		printf("_____________________\nTEST FT_STRDUP\n_____________________\n");
		char *one  =strdup("ceci est un test");
		char *two  =ft_strdup("ceci est un test");
		printf("strdup = %s ----------- ft_strdup = %s\n",one ,two );
		free(one);
		free(two);
	}
	{
		printf("_____________________\nTEST FT_LIST_SIZE\n_____________________\n");
		t_list *current = ft_lstnew(NULL);
		current->next = ft_lstnew(NULL);
		current->next->next = ft_lstnew(NULL);
		current->next->next->next = ft_lstnew(NULL);
		printf("ft_list_size = %d\n", ft_list_size(current));
		free(current->next->next->next);
		free(current->next->next);
		free(current->next);
		free(current);
	}
	{
		printf("_____________________\nTEST FT_LIST_PUSH_FRONT\n_____________________\n");

		t_list *current = ft_lstnew("ok");
		printf("%s\n", (char *)current->content);
		ft_list_push_front(&current, "test");
		printf("%s\n", (char *)current->content);
		printf("%d\n", ft_list_size(current));
	//	printf("%s\n", (char *)current->next->content);
		free(current->next);
		free(current);
	}
}
