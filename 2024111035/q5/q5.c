// CSO, A1Q5 - answer[i] = product of all elements in arr except i

#include <stdio.h>

void q5(long long int* arr, long long int n, long long int* ans);

/*void q5(long long int* arr, long long int n, long long int* answer)
{
	long long int prod=1;
	long long int zero=0;
	for(int i=0;i<n;i++) 
	{
		if(arr[i]==0) zero++;
		else prod*=arr[i];
	}
	for(int i=0;i<n;i++)
	{
		if(arr[i]==0 && zero==1) answer[i]=prod;
		else if(arr[i]==0 && zero>1) answer[i]=0;
		else if(arr[i]!=0 && zero>=1) answer[i]=0;
		else if(arr[i]!=0 && zero==0) answer[i]=prod/arr[i];
	}
}*/

int main()
{
	long long int n;
	scanf("%lld",&n);
	long long int arr[n];
	long long int answer[n];
	for(int i=0;i<n;i++) scanf("%lld",&arr[i]);
	q5(arr,n,answer);
	for(int i=0;i<n;i++) printf("%lld ",answer[i]);
	printf("\n");
}
