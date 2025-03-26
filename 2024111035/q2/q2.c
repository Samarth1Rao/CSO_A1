#include <stdio.h>

void rotate(long long int* arr, long long int n);

/*
void rotate(long long int* arr, long long int n)
{
	long long int temp1=arr[n-2];
	long long int temp2=arr[n-1];

	for(int i=n-1;i>=0;i--)
	{
		arr[i]=arr[i-2];
	} 
	arr[0]=temp1;
	arr[1]=temp2;
	// do smt about size = 1,2
}
*/

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
