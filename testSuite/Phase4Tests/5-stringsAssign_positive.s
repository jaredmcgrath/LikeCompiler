    .data    
    .comm    u,260
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    .data    
s15:    .asciz  "strang1111111"
    .text    
    movl    $4,n
    pushl    u+0
    lea    s15,%eax
    pushl    %eax
    pushl    $0
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    .data    
s63:    .asciz  "otherstrang"
    .text    
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+4,%eax
    pushl    %eax
    lea    s63,%eax
    pushl    %eax
    call    pttrap101
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    $8,n
    pushl    u+0
    lea    u+4,%eax
    pushl    %eax
    pushl    $0
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    call    pttrap0
    leave    
    ret    
