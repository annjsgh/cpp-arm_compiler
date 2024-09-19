#include<stdio.h>

int main()
{
    int i,n,f,g;
    scanf("%d",&n);
    i=1+1;
    f=1;
    g=i+f;
    while(i<=n)
    {
        f=f*i;
        i=i+1;
    }
    printf("%d",f);
    printf("\n");
}