    .data    
    .comm    u,8
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $3,n
    movl    $5,u+4
b1:    movl    $4,n
    cmpl    $0,u+4
    jle    f2
    incl    n
    decl    u+4
    incl    n
    pushl    u+0
    pushl    u+4
    pushl    $10
    call    pttrap8
    addl    $12,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    jmp    b1
f2:    movl    $9,n
    call    pttrap0
    leave    
    ret    
