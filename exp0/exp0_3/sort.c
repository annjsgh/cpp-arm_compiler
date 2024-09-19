#include<stdio.h>

void bubblesort(int arr[], int length)
{
    for(int a=0; a<length-1;a++)
    {
        for(int b=0;b<length-a-1;b++)
        {
            if(arr[b]>arr[b+1])
            {
                int temp =arr[b];
                arr[b] = arr[b+1];
                arr[b+1] = temp;
            }
        }
    }
}

int main()
{
    int arr[5];
    int length = 5;
    printf("please enter 5 numbers\n");
    for(int a=0;a<length;a++)
    {
        scanf("%d",&arr[a]);
    }
    bubblesort(arr,length);
    for(int a=0;a<length;a++)
    {
        printf("%d ",arr[a]);
    }
    printf("\n");
    return 0;
}