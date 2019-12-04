CC = fasm

.PHONY: default compile build
default: compile build

compile: bubble_sort.asm
	$(CC) bubble_sort.asm
	
build: call_from_asm.asm call_from_c.c bubble_sort.o
	$(CC) call_from_asm.asm
	gcc -no-pie call_from_asm.o bubble_sort.o -o call_from_asm
	gcc call_from_c.c bubble_sort.o -o call_from_c
	
run: call_from_c
	./call_from_c
