CC = fasm

.PHONY: default compile build
default: compile build

compile: bubble_sort.asm
	$(CC) bubble_sort.asm
	
build: main.asm bubble_sort.o
	$(CC) main.asm
	gcc -no-pie main.o bubble_sort.o -o main
	
run: main
	./main
