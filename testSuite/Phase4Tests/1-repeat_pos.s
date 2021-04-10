    .data    
    .comm    u,8
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $3,n
    movl    $0,u+4
b1:    movl    $5,n
    movl    $2,%eax
    addl    %eax,u+4
    movl    $10,%eax
    cmpl    u+4,%eax
    jle    f2
    jmp    b1
f2:    movl    $7,n
    call    pttrap0
    leave    
    ret    
