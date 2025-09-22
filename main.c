#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include "libasm.h"

int main()
{
	{
		printf("TEST FT_STRLEN\n_____________________\n");
		printf("strlen = %zu ------ ft_strlen =%zu\n", strlen("12"),ft_strlen("12"));
	}
	{
		printf("TEST FT_STRCPY\n_____________________\n");
		char dest[100];
		char src[] = "ca marche" ;
		printf("strcpy =%s ------- ft_strcpy=%s\n", strcpy(dest, src), ft_strcpy(dest, src));
	}
	{
		printf("TEST FT_STRCMP\n_____________________\n");
		char s1[] = "sdfsdfr";
		char s2[] = "bonjour";
		printf("strcmp = %d ----- ft_strcmp = %d\n", strcmp(s1, s2), ft_strcmp(s1, s2));
	}
	{
		printf("TEST FT_WRITE\n_____________________\n");
		printf("write = %zd -------- ft_write = %zd\n", write(1, "test\n", 5), ft_write(1, "test\n", 5));
	}
	{
		printf("TEST FT_WRITE\n_____________________\n");
		printf("");
	}
}
