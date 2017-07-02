#include<iostream>
#include<cstdlib>
using namespace std;

void merge(long long int *a,long long int l,long long int m,long long int r){
	long long int i, j, k;
	long long int len1 = m - l + 1;
	long long int len2 = r - m;
	long long int *a1;
	a1 = (long long int *)malloc(len1*sizeof(long long int));
	long long int *a2;
	a2 = (long long int *)malloc(len2*sizeof(long long int));
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
 
void mergesort(long long int *a, long long int l, long long int r){
	if (l < r){
		long long int m = l + ((r-l) / 2);
		mergesort(a, l, m);
		mergesort(a, m + 1, r);
		merge(a, l, m, r);
	}
}

int main() {
	int t,n,k;
	long long int sum1,sum2,i;
	cin>>t;
	while(t--){
	    sum1=sum2=0;
	    cin>>n>>k;
	    long long int a[n];
	    for(i=0;i<n;i++){ cin>>a[i]; sum1+=a[i];}
	    mergesort(a, 0, n-1);
	    if(k<=n/2)
		for(i=0;i<k;i++) sum2+=a[i];
	    else 
		for(i=0;i<n-k;i++) sum2+=a[i];
	    cout<<sum1-2*sum2<<endl;
	}
	return 0;
}
