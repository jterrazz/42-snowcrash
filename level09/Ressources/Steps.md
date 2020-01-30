# Level 09

Nm: getenv and open.

```
level09@SnowCrash:~$ ./level09 aaa
abc
```

Donc le programme affiche avec un decallage.

On peut car le token mais ya des chars bizarres.

We assume this is what they used to encode the token. We have to reverse it.

```python
import sys

i = 0
str = sys.argv[1]
for s in str:
  sys.stdout.write(chr(ord(s) - i))
  i += 1
```

We log to flag09: f3iji1ju5yuevaus41q1afiuq.

