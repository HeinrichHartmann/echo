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

![demo](https://raw.githubusercontent.com/HeinrichHartmann/echo/master/gdb_demo.png)

0. Start gdb

   ```
   gdb --args echo arg1 arg2 arg3
   ```

1. Run echo:

   ```
   break _start
   run
   ```

2. Enable TUI mode

   ```
   layout asm
   layout regs
   ```

3. Start stepping with `si`

Or, just use:

```
make debug
```
