# Level 01

We saw in the `/etc/passwd` that the flag01 has a special value. Compared to other users, this one keeps its password in this file. The others with an `x` are unacessible in `/etc/shadow`.

We copy the line in a file for johntheripper to decrypt it. ./john file

It gives us `abcdefg`

