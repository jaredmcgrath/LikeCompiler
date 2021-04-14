    .data    
    .comm    u,8
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $3,n
    movb    $1,%al
    movb    %al,u+4
    movl    $6,n
    movl    $1,%eax
    cmpl    $0,%eax
    jne    f1
    movb    $1,%al
    jmp    f2
f1:    movb    $0,%al
f2:    movb    %al,u+5
    movl    $9,n
    movl    $2,%eax
    cmpl    $1,%eax
    jle    f3
    movb    $1,%al
    jmp    f4
f3:    movb    $0,%al
f4:    movb    %al,u+6
    movl    $12,n
    movl    $2,%eax
    cmpl    $0,%eax
    jg    f5
    movb    $1,%al
    jmp    f6
f5:    movb    $0,%al
f6:    movb    %al,u+7
    incl    n
    call    pttrap0
    leave    
    ret    
