
OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)
SECTIONS
{
	. = 0x00000000;

	. = ALIGN(4);
	.text	:
	{
		arch/arm/cpu/hi3716mv420n/start.o	(.text)
		arch/arm/cpu/hi3716mv420n/chip.o	(.text)
		arch/arm/cpu/hi3716mv420n/uart.o	(.text)
		*(.text)
	}
	__text_end = .;
	. = . + 0x84;
	. = ALIGN(4);
	.rodata : { *(SORT_BY_ALIGNMENT(SORT_BY_NAME(.rodata*))) }

	. = ALIGN(4);
	.data : { *(.data) }

	. = ALIGN(4);
	.got : { *(.got) }

	__u_boot_cmd_start = .;
	.u_boot_cmd : { *(.u_boot_cmd) }
	__u_boot_cmd_end = .;

	. = ALIGN(4);
	.image : { *(.image) }

	.tail :
	{
		arch/arm/cpu/hi3716mv420n/tail.o	(.tail)
	}

	. = ALIGN(4);
	__bss_start = .;
	.bss : { *(.bss) }
	_end = .;
}
