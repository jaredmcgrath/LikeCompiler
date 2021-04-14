    .data    
    .comm    u,8
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $0,u+4
    movl    $4,n
    jmp    f1
v26:    movl    $4,n
    movl    $6,n
    incl    u+4
    jmp    m22
a22:b2:    movl    $7,n
    pushl    n
    call    pttrap14
f1:    movl    u+4,%eax
    cmpl    $0,%eax
    ja    b2
    shl    $2,%eax
    movl    c22(%eax),%eax
    jmp    *%eax
    .data    
c22:    .long    v26
    .text    
m22:    movl    $7,n
    call    pttrap0
    leave    
    ret    
