    .data    
    .comm    u,780
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $1,u+4
    movl    $3,u+8
    movl    $4,n
    .data    
s35:    .asciz  "testing"
    .text    
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    s35,%eax
    pushl    %eax
    lea    u+4,%eax
    pushl    %eax
    call    pttrap101
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s60:    .asciz  "testing2"
    .text    
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    s60,%eax
    pushl    %eax
    lea    u+12,%eax
    pushl    %eax
    call    pttrap101
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s86:    .asciz  "testing3"
    .text    
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    s86,%eax
    pushl    %eax
    lea    u+268,%eax
    pushl    %eax
    call    pttrap101
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
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
    movl    $10,n
    pushl    u+0
    lea    u+12,%eax
    pushl    %eax
    pushl    $0
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    movl    $13,n
    pushl    u+0
    lea    u+268,%eax
    pushl    %eax
    pushl    $0
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    movl    $16,n
    .data    
s205:    .asciz  "testing4000000000000 craziness"
    .text    
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    s205,%eax
    pushl    %eax
    lea    u+268,%eax
    pushl    %eax
    call    pttrap101
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    pushl    u+0
    lea    u+268,%eax
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
