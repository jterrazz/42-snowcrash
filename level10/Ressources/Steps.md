# Level 10

We can't cat token, so we might have to hack into the exec.

inet_addr and htons and socket = tcp functions. Also read and write to show result. 

In strings: `Connecting to %s:6969 ..` so we might have a server.

```
./level10 token localhost
You don't have access to token
```

Lets listen for connections

```
nc -l 6969
```

./level10 /tmp/test 127.0.0.1

From nm we see it's checking permissions from access function. 



https://stackoverflow.com/questions/7925177/access-security-hole

```
Warning: Using access() to check if a user is authorized to, for example, open a file before actually doing so
       using open(2) creates a security hole, because the user might exploit the short time interval between checking
       and  opening  the file to manipulate it.
```
http://www.csl.sri.com/users/ddean/papers/usenix04.pdf

We find the flag
woupa2yuojeeaaed06riuj63c
