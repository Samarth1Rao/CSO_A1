#include <stdio.h>
#include <stdlib.h>

long long int diffMaxMin(long long int* arr, long long int n);

int main()
{
	long long int n;
	scanf("%lld",&n);
	long long int *arr = malloc(n*sizeof(long long int));
	if(!arr) return 1;
	for(int i=0;i<n;i++) scanf("%lld",&arr[i]);
	long long int result = diffMaxMin(arr,n);
	free(arr);
	printf("%lld\n",result);
}
