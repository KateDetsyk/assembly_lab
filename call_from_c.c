#include <stdio.h>
#include <stdint.h>

#define SIZE 5

extern void bubble_sort(uint8_t * array, size_t size);

void print_bytes(uint8_t * array, size_t size) {
	printf("[ ");
	for (size_t i = 0; i < size; ++i) {
		printf("%d ", array[i]);
	}
	printf("]\n");
}

int main(void) {
	uint8_t array[SIZE] = { 5, 4, 3, 2, 1 };
	bubble_sort(array, SIZE);
	print_bytes(array, SIZE);
	return 0;
}
	