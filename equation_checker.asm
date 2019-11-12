format pe64 console

section '.text' executable

start:

   mov  eax, length      ;number of element in arr
   mov  ecx, a     ;ECX will point to the current element in a
   mov  edx, b
   mov  ebx, c

top:
   mov  ax, [edx]
   mov  bl, [ecx]
   div  bl

   cmp ah, 0
   jpe addone

   mov ebx, 0

   add  ecx, 1      ;move pointer to next element
   add  edx, 1
   add  ebx, 1
   dec  eax        ;decrement counter
   jnz  top        ;if counter not 0, then loop again

   jmp exit

addone:
   mov  ebx, 1
   add  ecx, 1      ;move pointer to next element
   add  edx, 1
   add  ebx, 1
   dec  eax        ;decrement counter
   jnz  top

   jmp exit

exit:
        mov ax, 4c00h
        int 21h

;ret

section '.data'
length db 3
a:
   db  1
   db  1
   db  1

b:
   db 1
   db 1
   db 3

c:
   db  0
   db  0
   db  0
