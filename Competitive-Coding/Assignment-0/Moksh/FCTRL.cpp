#include<iostream>

using namespace std;

int main() {
    long long int t,n,j,c;
    cin>>t;
    while (t--) {
        cin>>n;
        c = 0;
        for(j = 5; n/j >= 1; j*=5)
            c += n/j;
        cout<<c<<endl;
    }
}
