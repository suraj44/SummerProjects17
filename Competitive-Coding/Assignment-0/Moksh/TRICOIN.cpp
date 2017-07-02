#include<iostream>
using namespace std;

int main() {
    long int t,n,i,count;
    cin>>t;
    while(t--){
        cin>>n;
        i=1;
        count=0;
        while(true) {
            n -= i;
            if(n <0 )
                break;
            i++;
            count++;
        }
        cout<<count<<endl;
    }
}