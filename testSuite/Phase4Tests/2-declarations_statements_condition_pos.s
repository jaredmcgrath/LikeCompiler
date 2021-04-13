    .data    
    .comm    u,6
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $3,n
    movl    $1,%eax
    cmpl    $0,%eax
    jne    f1
    movb    $1,%al
    jmp    f2
f1:    movb    $0,%al
f2:    movb    %al,u+4
    incl    n
    call    pttrap0
    leave    
    ret    
