    .data    
    .comm    u,6
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movb    $1,u+4
    movl    $3,n
    movl    $2,%eax
    cmpl    $1,%eax
    jg    f1
    movb    $1,%al
    jmp    f2
f1:    movb    $0,%al
f2:    movb    %al,u+4
    call    pttrap0
    leave    
    ret    
