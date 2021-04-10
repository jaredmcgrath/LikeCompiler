    .data    
    .comm    u,8
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $6,n
    movl    $30,%eax
    cmpl    $50,%eax
    jle    f1
    incl    n
    movl    $50,u+4
    jmp    f2
f1:    movl    $8,n
    movl    $30,%eax
    cmpl    $25,%eax
    jle    f3
    incl    n
    movl    $25,u+4
    jmp    f4
f3:    movl    $11,n
    movl    $10,u+4
f4:f2:    movl    $13,n
    call    pttrap0
    leave    
    ret    
