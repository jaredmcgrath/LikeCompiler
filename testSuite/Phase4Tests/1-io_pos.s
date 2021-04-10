    .data    
    .comm    u,16
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $1,u+0
    movl    $2,u+4
    movl    $7,n
    pushl    u+4
    pushl    $1
    pushl    $10
    call    pttrap8
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    pushl    u+0
    lea    u+8,%eax
    pushl    %eax
    call    pttrap10
    addl    $8,%esp
    pushl    u+0
    lea    u+12,%eax
    pushl    %eax
    call    pttrap10
    addl    $8,%esp
    incl    n
    pushl    u+0
    call    pttrap4
    addl    $4,%esp
    movl    $12,n
    pushl    u+4
    pushl    u+8
    pushl    $10
    call    pttrap8
    addl    $12,%esp
    pushl    u+4
    pushl    u+12
    pushl    $10
    call    pttrap8
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    call    pttrap0
    leave    
    ret    
