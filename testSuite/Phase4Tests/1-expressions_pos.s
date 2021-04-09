    .data    
    .comm    u,10
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $6,n
    movl    $8,u+4
    incl    n
    cmpl    $21,u+4
    jg    f1
    movb    $1,%al
    jmp    f2
f1:    movb    $0,%al
f2:    movb    %al,u+8
    incl    n
    call    pttrap0
    leave    
    ret    
