#include <stdio.h>
#include <string.h>

#define MAX_SIZE 10001

int isPalindrome(char* str, int len);

int main()
{
	char str[MAX_SIZE];
	scanf("%s", str);
	int len = strlen(str);
	if(isPalindrome(str,len)==1) printf("1\n");
	else printf("0\n");
}
