    .data    
    .comm    u,260
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    .data    
s16:    .asciz  "string"
    .text    
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    pushl    u+4
    lea    s16,%eax
    pushl    %eax
    call    pttrap101
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    $3,n
    call    pttrap0
    leave    
    ret    
