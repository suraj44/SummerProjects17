  #include<bits/stdc++.h>
        using namespace std;
        int main()
        {
        int x;
        float y;
        scanf("%d",&x);
        scanf("%f",&y);
        if(y>=x+0.50)
        {
           if(x%5)
              {
                 printf("%.2f",y);
              }
              else
              {
                  printf("%.2f",y-x-0.50);
              }
        }
        else
        {
            printf("%.2f",y);
        }
        return 0;
        }
