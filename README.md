# echo

echo prints the first positional argument to stdout.

## Usage

```
echo foo
```

## Build

The following steps work on Linux machines.

Compile:

```
nasm -f elf32 echo.asm
```

Link:

```
ld -m elf_i386 -s -o echo echo.o
```

## Debug

0. Run echo under gdb

   ```
   gdb --args echo arg1 arg2 arg3
   ```

1. Enable TUI mode:

   ```
   layout asm
   layout regs
   ```

2. Step through code:

   ```
   break _start
   run
   si
   si
   ```

Or, just use:

```
make debug
```
