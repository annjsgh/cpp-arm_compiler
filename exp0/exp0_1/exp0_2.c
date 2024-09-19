#include<stdio.h>
#define FIXNUM 2  //添加宏定义

int main()
{
    int i,n,f;
    scanf("%d",&n); //输入n的值（添加注释）
    i=FIXNUM;
    f=1;
    while(i<=n)
    {
        f=f*i;
        i=i+1;
    }
    printf("%d",f);
    printf("\n");
    
    #ifdef FIXNUM  // 条件编译如果宏被定义就进行编译
    printf("hello!\n");
    #endif

    #ifndef FIXNUM// 如果宏未被定义就进行编译；
    printf("I am not defined");
    #else // 作为其它预处理的剩余选项进行编译
    printf("I am defined");
    #endif
}