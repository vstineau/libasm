#include <stdio.h>
#include <string.h>
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
}
