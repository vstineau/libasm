
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

int main() {
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
