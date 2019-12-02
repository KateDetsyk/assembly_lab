CC = fasm

.PHONY: default compile build run
default: compile build run

compile: bubble_sort.asm
	$(CC) bubble_sort.asm
	
build: main.asm bubble_sort.o
	$(CC) main.asm
	ld main.o bubble_sort.o -o main
	
run: main
	./main