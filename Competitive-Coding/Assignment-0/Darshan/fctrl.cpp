    #include<bits/stdc++.h>
    using namespace std;
    int main()
    {

        long long n,t;
        cin>>t;
        while(t--)
        {
            cin>>n;
            long long z=0;
            long long p=n/5;
            register int i=0;

            while(p)
            {
                ++i;
                p=n/pow(5,i);
                z+=p;
            }
            cout<<z<<"\n";
        }
        return 0;
    }
