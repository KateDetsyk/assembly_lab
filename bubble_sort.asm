format ELF64

public bubble_sort

section '.bubble_sort' executable
;input rax = array
;rbx = array size
bubble_sort:
	push rax                                     ;push registers in stack to save values in them after func end
	push rbx
	push rcx
	push rdx
	xor rcx, rcx                                 ; for i, make it zero at the beginning
	.first_cycle:
		cmp rcx, rbx
		je .close
		xor rdx, rdx                             ; for j, make it zero at the beginning
		push rbx
		sub rbx, rcx
		dec rbx
		.second_cycle:
			cmp rdx, rbx
			je .close_second_cycle
			push rbx                             ; push to stack to save it value
			mov bl, [rax+rdx]               ;use bl 8bit,  'part' of rbx 
			cmp bl, [rax+rdx+1]
			jg .swap
			jmp .pass
		.swap:                                     ;change array[j] with array[j+1] if array[j] > array[j+1]
			push rcx
			mov cl, [rax+rdx+1]
			mov [rax+rdx+1], bl
			mov [rax+rdx], cl
			pop rcx
		.pass:
			pop rbx
			inc rdx
			jmp .second_cycle
		.close_second_cycle:
			pop rbx
			inc rcx
			jmp .first_cycle
	.close:
	    pop rdx                                 ; pop saved values from stack
		pop rcx
		pop rbx
		pop rax
		ret