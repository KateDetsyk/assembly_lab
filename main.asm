format elf64
public _start

include "bubble_sort.inc"

section '.data' writable
	array db 5, 4, 3, 2, 1
	array_size equ 5
	
section '.text' executable
_start:
	mov rax, array
	mov rbx, array_size
	call bubble_sort
	call exit
	
section '.exit' executable
exit:
	mov rax, 1 ;1 --- exit
	mov rbx, 0 ; 0 --- return
	int 0x80