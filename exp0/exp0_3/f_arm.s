.arch armv7-a
 @ comm section save global variable without initialization
 .comm a, 4 @global variables
 .comm b, 4
 .comm i, 4
 .comm t, 4
 .comm n, 4
 .text @下面为代码区
 .p2align 2 
 .section .rodata @只读数据区
 .p2align 2 
 _str0:
 .ascii "please input the number\012\000" @\000 for `null character` \012是换行符
 .p2align 2 
 _str1:
 .ascii	"%d\000" 
 .p2align 2 
 _str2:
 .ascii	"%d\012\000" @\012是换行符
 .p2align 2 
 .text
 .p2align 2

 .global main
 main:
 push {fp, lr}
 add fp, sp, #4
 ldr r0, _bridge+20 @ *r0 = "please input the number\000"
 bl printf
 ldr r1, _bridge+16 @ r1 = &n
 ldr r0, _bridge+24 @ *r0 = "%d\012\000"
 bl __isoc99_scanf @ scanf("%d",&n)
 ldr r1, _bridge+16 @ r1 = &n
 ldr r4, [r1] @ n的值先存入r4
 ldr r1, _bridge @ r1 = &a
 mov r1, #0 @初始化a=0
 mov r5, r1 @a的值先存入r5
 ldr r0, _bridge+28 @ *r0 = "%d\012\000"
 bl printf
 ldr r1, _bridge+4 @ r1 = &b
 mov r1, #1 @初始化b=1
 mov r6, r1 @b的值先存入r6
 ldr r0, _bridge+28 @ *r0 = "%d\012\000"
 bl printf
 ldr r7, _bridge+8 @ r7 = i  i的值先存入r7
 mov r7, #1 @初始化i=1
.LOOP:
 @ a->r5 b->r6 i->r7 n->r4 t->r8
 cmp r7, r4  @ 比较 i 和 n
 bge .ENDLOOP  @ 大于或等于则跳转
 ldr r8, _bridge+12 @ r8 = t 
 mov r8, r6 @ t = b
 add r6, r5, r6 @ b = a + b
 mov r1, r6
 ldr r0, _bridge+28 @ *r0 = "%d\012\000"
 bl printf
 mov r5, r8 @ a = t
 add r7, r7, #1 @i = i + 1
 b .LOOP
.ENDLOOP:
 mov r0, #0
 pop {fp, pc} @ return 0
  
  _bridge:
 .word a
 .word b
 .word i
 .word t
 .word n
 .word _str0
 .word _str1
 .word _str2
 
 .section .note.GNU-stack,"",%progbits
 