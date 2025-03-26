// ASSUMPTIONS:
// 1. All elements arr[i] abide by 0<arr[i]<10001
// 2. Every input will have a valid lonely element (will output -1 otherwise)

#include <stdio.h>
#include <stdlib.h>

long long int q1(long long int arr[]);

// Function to find the number that appears only once
/*long long int q1(long long int arr[]) 
{
    // We will create a frequency array
    long long int freq[10001] = {0};
    
    long long int n = arr[0];
    long long int size = 3*n + 1;
    
    // Count frequencies (start from index 1 since arr[0] is n)
    for(long long int i = 1; i <= size; i++) 
        freq[arr[i]]++;
    
    
    // Find the number with frequency 1
    for(long long int i = 0; i <= 100; i++) 
    {
        if(freq[i] == 1) 
            return i;
    }
    
    return -1; // No unique number found
}*/

int main() 
{
    long long int n;
    scanf("%lld", &n);
    
    // Array size is 3n+1 + 1 extra for storing n itself in the 0th place
    long long int size=(3*n)+2;
    long long int* arr = (long long int*)malloc(size * sizeof(long long int));
    
    arr[0] = n;
    
    for(long long int i = 1; i <= 3*n + 1; i++) 
        scanf("%lld", &arr[i]);

    long long int result = q1(arr);
    printf("%lld\n", result);
    
    free(arr);
    return 0;
}
