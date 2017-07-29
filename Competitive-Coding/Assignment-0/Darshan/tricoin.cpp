    #include<bits/stdc++.h>
    using namespace std;
    int main()
    {
        int t;
        long long s;
        cin>>t;
        while(t--)
        {
            cin>>s;
            int p=sqrt(1+8*s);
            p--;
            p/=2;
            cout<<p<<"\n";

        }
        return 0;
    }
