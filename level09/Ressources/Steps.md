# Level 09

Similar to `level08` a binary and a token can be found in the directory.

```bash
ltrace ./level09 token
__libc_start_main(0x80487ce, 2, 0xbffff7d4, 0x8048aa0, 0x8048b10 <unfinished ...>
ptrace(0, 0, 1, 0, 0xb7e2fe38)                                            = -1
puts("You should not reverse this"You should not reverse this
)                                       = 28
+++ exited (status 1) +++
```

Tthe token is readable this time, perhaps it was already encrypted using the binary, and must be reversed. After a little testing, it seems like the binary simply adds the index number in the string to its value.

```bash
./level09 0000000000
# 0123456789

./level09 9876543210
# 9999999999
```

We can write a simple program to reverse the token

```python
import sys

i = 0
str = sys.argv[1]
for s in str:
  sys.stdout.write(chr(ord(s) - i))
  i += 1
```

```bash
./tmp/reverser token
# f3iji1ju5yuevaus41q1afiuq
# Don't forget to launch getflag !
getflag
# Check flag.Here is your token : s5cAJpM8ev6XHw998pRWG728z
```

