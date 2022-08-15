#include <stdio.h>

#define MAX_SIZE 6

typedef struct stk{
    char data[MAX_SIZE];
    int front;
    int rear;
}stack;

stack S;
void enstack(stack *S,char value)
{
    /* S->data[++S->rear] = value; */
    if ((S->rear +1)%MAX_SIZE == S->front)
    {
        /* full */
    }
    else
    {
        S->rear = (S->rear + 1)% MAX_SIZE;
        S->data[S->rear] = value;
    }
}
void destack(stack *S)
{
    if (S->front == S->rear)
    {
        /* empty */
    }
    else
    {
        S->front = (S->front + 1)%MAX_SIZE;
        printf("%c",S->data[S->front]);
    }
}
int main(void)
{
    S.front = 0;
    S.rear  = 0;
    /* int i; */
    /* FILE *fp; */
    /* fp = fopen("test.txt", "w+"); */
    /* fprintf(fp,"hexValue = ["); */
    /* for(i=0;i<=0xFF;i++) */
    /* { */
    /* fprintf(fp,"'"); */
    /* fprintf(fp,"%c",i); */
    /* fprintf(fp,"'"); */
    /* fprintf(fp,","); */
    /* } */
    /* fprintf(fp,"]\n"); */
    printf("Hello World.\n");
    /* fclose(fp); */
    return 0;
}
