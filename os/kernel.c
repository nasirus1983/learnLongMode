#include "tools.h"

#define WHITE_TXT 0x07 // white on black text

void k_clear_screen();
extern "C" void kmain()
{
	const short color = 0x0F00;
	const char *hello = "Hello cpp world !!!!!!!!!!!!!!!!!#";
	int hello_len = custom_len(hello);
	k_clear_screen();
	short *vga = (short *)0xb8000;
	for (int i = 0; i < hello_len; i++)
	{
		vga[i + 80] = color | hello[i];
	}
}

void k_clear_screen() // clear the entire text screen
{
	char *vidmem = (char *)0xb8000;
	unsigned int i = 0;
	while (i < (80 * 25 * 2))
	{
		vidmem[i] = ' ';
		i++;
		vidmem[i] = WHITE_TXT;
		i++;
	};
};