.arch armv7-a
.fpu vfpv3-d16
 .comm arr, 4 @数组
 .comm flo, 4
 .text 
 .p2align 2 
 .section .rodata @只读数据区 字符串
 .p2align 2 
 _str0:
 .ascii "please enter 5 numbers\n"
 .p2align 2 
 _strin:
 .ascii	"%f\000"  @f
 .p2align 2 
 _strout:
 .ascii	"%f \000" @f
 .p2align 2 
 _str1:
 .ascii	"\n\000" 
 .p2align 2 
 _strtest:
 .ascii	"%d \000" 
 .p2align 2 
 _strtestin:
 .ascii	"%d\000" 
 .p2align 2 
 .text
 .p2align 2


 .global bubblesort
 bubblesort: @bubblesort(float arr[], int length)
 str fp, [sp, #-4]! @ pre-index mode, sp = sp - 4, push fp
 mov fp, sp
 str r0, [fp, #-8] @ r0 = [fp, #-8] = arr
 str r1, [fp, #-12] @ r1 = [fp, #-12] = length
 mov r4, #0 @a=0                                              r4: a                       
 ldr r5, [fp, #-12] 
 sub r5, r5, #1 @                                             r5: length-1
 ldr r6, [fp, #-8]  @  r6 = arr                               r6: arr

.OUTLOOP: @外层循环
 cmp r4, r5   
 bge .ENDOUTLOOP  @  a >= length-1 循环结束
 mov r7, #0 @b=0                                              r7: b
 sub r8, r5, r4   @算出b的界限                                 r8: b的边界

.INNERLOOP: @内层循环
 cmp r7, r8   
 bge .ENDINNERLOOP  @  b >= length-1-a 循环结束
 lsl r2, r7, #2    @ r2 = r7 << 2 ( r7 * 4)
 add r1, r6, r2    @ r1 = r6 + r2                             r1: &arr[b]
 ldr r2, [r1]      @                                          r2: arr[b]
 add r1, r1, #4     
 ldr r0, [r1]      @                                          r0: arr[b+1]
 cmp r2, r0
 add r7, r7, #1  
 ble .INNERLOOP       @ arr[b] <= arr[b+1] 不交换
 str r2, [r1]  @ 将寄存器r2中的数据存储到内存地址[r1]处
 sub r1, r1, #4
 str r0, [r1]
 b .INNERLOOP

.ENDINNERLOOP: @一次内层循环结束
 add r4, r4, #1
 b .OUTLOOP

.ENDOUTLOOP: @函数结束
 ldr fp, [sp], #4 @ post-index mode, pop fp, sp = sp + 4
 bx lr @ recover sp fp pc
 

 .global main
 main:
 push {fp, lr}
 add fp, sp, #4
 ldr r0, _bridge @ "please enter 5 numbers\n"
 bl printf
 mov r5, #5 @                                                 r5: length
 ldr r6, _bridge+24 @                                         r6: arr(地址)

 mov r4, #0 @                                                 r4: a
.LOOPIN:
 cmp r4, r5
 bge .SORT  @  a >= length 循环结束
 ldr r0, _bridge+20 @ "%d\000"
 lsl r2, r4, #2    @ r2 = r4 << 2 ( r4 * 4)
 add r1, r6, r2    @ r1 = r6 + r2                             r1: &arr[a]
 bl __isoc99_scanf
 add r4, r4, #1
 b .LOOPIN

.SORT:
 mov r0, r6
 mov r1, r5
 bl bubblesort
 add r5, r5, #1 @length加回来

 mov r4, #0 @                                                 r4: a
.LOOPOUT:
 cmp r4, r5
 bge .END  @  a >= length 循环结束
 ldr r0, _bridge+16 @ "%d \000"
 lsl r2, r4, #2    @ r2 = r4 << 2 ( r4 * 4)
 add r3, r6, r2    @ r3 = r6 + r2                             r3: &arr[a]
 ldr r1, [r3]      @                                          r1: arr[a]
 bl printf
 add r4, r4, #1
 b .LOOPOUT

.END:

 ldr r0, _bridge+4 
 bl printf

 ldr r0, _bridge+8  @对浮点数相关指令的尝试
 ldr r1, _bridge+28  @r1=&flo
 bl __isoc99_scanf
 ldr r2, _bridge+28
 vldr.32 s0, [r2]
 vcvt.f64.f32	d0, s0
 vmov	r2, r3, d0
 ldr r0, _bridge+12
 bl printf

 ldr r0, _bridge+4 
 bl printf
 mov r0, #0
 pop {fp, pc} @ return 0

  _bridge:
 .word _str0
 .word _str1
 .word _strin
 .word _strout
 .word _strtest
 .word _strtestin
 .word arr
 .word flo

 .section .note.GNU-stack,"",%progbits
 