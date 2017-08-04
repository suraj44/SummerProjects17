#include<bits/stdc++.h>
using namespace std;
int main()
{
    int t;
    cin>>t;
    while(t--)
    {
        int n;
        cin>>n;
        string str,test,mini;
        cin>>str;
         mini=str;
        for(int i=0;i<n;i++)
        {
           test=str;
           for(int j=i;j<n-1;j++)
           {
               swap(test[j],test[j+1]);
               mini=min(test,mini);
           }
 
           test=str;
           for(int j=i;j>0;j--)
           {
               swap(test[j],test[j-1]);
               mini=min(test,mini);
           }
        }
        cout<<mini<<endl;
    }
} 
