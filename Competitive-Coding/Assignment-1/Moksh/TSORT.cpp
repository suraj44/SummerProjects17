#include<iostream>
#include<cstdlib>
using namespace std;

void merge(long int *a,long int l,long int m,long int r){
	long int i, j, k;
	long int len1 = m - l + 1;
	long int len2 = r - m;
	long int *a1;
	a1 = (long int *)malloc(len1*sizeof(long int));
	long int *a2;
	a2 = (long int *)malloc(len2*sizeof(long int));
	for (i = 0; i < len1; i++){
		*(a1 + i) = *(a+l + i);
	}
	for (i = 0; i < len2; i++){
		*(a2 + i) = *(a+m + 1 + i);
	}
	i = 0;
	j = 0;
	k = l;
	while (i < len1 && j < len2){
		if (*(a1 + i) <= *(a2 + j)){
			*(a + k) = *(a1 + i);
			i++;
		}
		else{
			*(a + k) = *(a2 + j);
			j++;
		}
		k++;
	}
	while (i < len1){
		*(a + k) = *(a1 + i);
		i++;
		k++;
	}
	while (j < len2){
		*(a + k) = *(a2 + j);
		j++;
		k++;
	}
	free(a1);
	free(a2);
}
 
void mergesort(long int *a, long int l, long int r){
	if (l < r){
		long int m = l + ((r-l) / 2);
		mergesort(a, l, m);
		mergesort(a, m + 1, r);
		merge(a, l, m, r);
	}
} 

int main() {
    long int t;
    cin>>t;
    long int a[t];
    for(long int i=0; i<t; i++)
        cin>>a[i];
    
    mergesort(a, 0, t-1);
    
    for(long int i=0; i<t; i++)
        cout<<a[i]<<"\n";
}