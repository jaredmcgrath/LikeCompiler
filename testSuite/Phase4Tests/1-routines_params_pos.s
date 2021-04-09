    .data    
    .comm    u,16
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    jmp    f1
p13:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+8
    movl    12(%ebp),%eax
    movl    %eax,u+4
    leave    
    ret    
f1:    movl    $9,n
    pushl    $1
    pushl    $3
    call    p13
    addl    $8,%esp
    movl    $9,n
    incl    n
    call    pttrap0
    leave    
    ret    
