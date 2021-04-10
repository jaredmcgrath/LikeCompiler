    .data    
    .comm    u,8
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    jmp    f1
p13:    pushl   %ebp
        movl    %esp, %ebp    
    leave    
    ret    
f1:    movl    $7,n
    call    p13
    addl    $0,%esp
    movl    $7,n
    incl    n
    call    pttrap0
    leave    
    ret    
