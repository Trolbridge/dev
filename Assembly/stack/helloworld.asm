;; Run with:
;; nasm -f macho64 -o helloworld.o helloworld.asm && 
;; ld helloworld.o -o hello -lSystem -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib
;; ./hello

SECTION .text

global _main


 
_main:

;    mov     rcx, 4                  ; Counter 9
    mov     cx, 4                  ; Counter 9
L1:
    push    cx
    mov     rdx, newLineLen             ;third argument: message length
    lea     rsi, [rel newLine]   ; move the memory address of our message string into rsi
    mov     rdi, 1           ; write to the STDOUT file
    mov     rax, 0x2000004   ; invoke SYS_WRITE (kernel opcode 4)
    syscall
    pop     cx

    dec     cx
    cmp     cx, 0x0                  
    jnz     L1

    mov     rdx, helloLen             ;third argument: message length
    lea     rsi, [rel msg]   ; move the memory address of our message string into rsi
    mov     rdi, 1           ; write to the STDOUT file
    mov     rax, 0x2000004   ; invoke SYS_WRITE (kernel opcode 4)
    syscall

;    mov     rdx, 13          ; number of bytes to write - one for each letter plus LF char.
    mov     rdx, jesusLen          ; number of bytes to write - one for each letter plus LF char.
    lea     rsi, [rel msg1]   ; move the memory address of our message string into rsi
    mov     rdi, 1           ; write to the STDOUT file
    mov     rax, 0x2000004   ; invoke SYS_WRITE (kernel opcode 4)
    syscall
    
    mov     rax, 0x2000001   ; exit
    mov     rdi, 0
    syscall

SECTION .data
newLine     db      'Hi my LOVEY YOU ARE DELICIOUS!', 0x0A ; assign msg variable
newLineLen equ     $ - newLine             ;length of our dear string

;msg     db      'Hello World!', 0x0A ; assign msg variable
msg     db      'Hello World!' ; assign msg variable
helloLen equ     $ - msg             ;length of our dear string

msg1    db      'Hello Jesus!', 0x0A
jesusLen equ     $ - msg1             ;length of our dear string

