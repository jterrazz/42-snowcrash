# Level13

A binary with flag13 rights can be found in the directory.

```bash
ltrace ./level13
__libc_start_main(0x804858c, 1, 0xbffff7d4, 0x80485f0, 0x8048660 <unfinished ...>
getuid()                                                               = 2013
getuid()                                                               = 2013
printf("UID %d started us but we we expe"..., 2013UID 2013 started us but we we expect 4242
)                    = 42
exit(1 <unfinished ...>
+++ exited (status 1) +++
```

We can see that the program checks our uid with getuid() before running. To fool it, we can write and link our own `getuid()` library.

From /tmp/ directory:

```bash
gcc -shared -o /tmp/getuid.so /tmp/getuid.c
export LD_PRELOAD=/tmp/getuid.so

./level13
UID 2013 started us but we we expect 4242
```

It does not work because it does not use our env variables, however ltrace and gdb do.

```bash
ltrace ./level13
__libc_start_main(0x804858c, 1, 0xbffff7d4, 0x80485f0, 0x8048660 <unfinished ...>
getuid()                                                               = 4242
strdup("boe]!ai0FB@.:|L6l@A?>qJ}I")                                    = 0x0804b008
printf("your token is %s\n", "2A31L79asukciNyi8uppkEuSx"your token is 2A31L79asukciNyi8uppkEuSx
)              = 40
+++ exited (status 40) +++
```