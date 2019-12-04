format elf64
public main

include "bubble_sort.inc"

extrn printf
	
section '.data' writable
	array db 5, 4, 3, 2, 1
	array_size equ 5
	fmt db "%d", 0xA, 0
	
section '.text' writable
main:
	mov rdi, array
	mov rsi, array_size
	call bubble_sort
	
	mov rax, rdi
	mov rbx, rsi
	call print_array

	xor rax, rax ; return zero	
	ret
	
section '.print_array' executable
; function to print array using printf from c, but i get segmentation fault there,
; so it's print only first number in array
;input rax = array
;rbx = array_size
print_array:
	push rsi
	push rdi
	push rax
	push rbx
	push rcx 
	mov rcx, rax
	xor rax, rax
	.next_iter:
		cmp rbx, 0
		je .close
		mov al, [rcx]
	
		mov rdi, fmt
	    mov rsi, rax
		xor rax, rax
		call printf

		inc rcx
		dec rbx
		jmp .next_iter
	.close:
		pop rcx
		pop rbx
		pop rax
		pop rdi
		pop rsi

		ret
	
