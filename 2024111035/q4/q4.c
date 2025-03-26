#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

long long int diffMaxMin(long long int* arr, long long int n);

/*
long long int diffMaxMin(long long int* arr, long long int n)
{
	long long int max = LL_MIN;
	long long int min = LL_MAX;

	for(long long int i=0;i<n;i++)
	{
		if(arr[i]>max) max=arr[i];
		if(arr[i]<min) min=arr[i];
	}

	return (max-min);
}
*/

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
