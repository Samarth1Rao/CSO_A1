#include <stdio.h>

void rotate(long long int* arr, long long int n);

int main()
{
	long long int n;
	scanf("%lld",&n);
	long long int arr[n];
	for(int i=0;i<n;i++) scanf("%lld",&arr[i]);
	rotate(arr,n);
	for(int i=0;i<n;i++) printf("%lld ",arr[i]);
	printf("\n");
	return 0;
}
