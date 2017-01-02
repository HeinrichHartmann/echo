.PHONY: clean debug show-symbols show-hex show-disasm

echo: echo.o
	@# -s -- strip all symbols (ommitted)
	ld -m elf_i386 -o echo echo.o

echo.o: echo.asm
	@# -g -- emit debug symbols
	@# -F -- specify debug format (dwarf)
	nasm -f elf32 -F dwarf -g echo.asm

test: echo
	./echo arg1 arg2 arg3

clean:
	git clean -i

show-symbols: echo
	nm echo

show-hex: echo
	hd echo

show-disasm: echo
	objdump -d echo

cmd.gdb:
	printf "%s\n" "break _start" "layout asm" "layout regs" "run" > $@

debug: echo cmd.gdb
	gdb -x cmd.gdb --args echo arg1 arg2 arg3
