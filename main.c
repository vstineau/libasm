#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>

#include "libasm.h"

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
		int fd  = open("Makefile", O_RDONLY);
		int fd1  = open("Makefile", O_RDONLY);
		printf("read = %zd and buff1 = %s\n", read(fd, buf1, 50), buf1);
		printf("ft_read = %zd and buff2 = %s\n", read(fd1, buf2, 50), buf2);
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
}
