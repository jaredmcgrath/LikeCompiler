    .data    
    .comm    u,8
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $0,u+4
    movl    $5,n
    jmp    f1
v26:    movl    $5,n
    movl    $7,n
    incl    u+4
    jmp    m22
v42:    movl    $8,n
    incl    n
    movl    $2,%eax
    addl    %eax,u+4
    jmp    m22
a22:b2:    movl    $10,n
    pushl    n
    call    pttrap14
f1:    movl    u+4,%eax
    decl    %eax
    cmpl    $1,%eax
    ja    b2
    shl    $2,%eax
    movl    c22(%eax),%eax
    jmp    *%eax
    .data    
c22:    .long    v26
    .long    v42
    .text    
m22:    movl    $10,n
    call    pttrap0
    leave    
    ret    
