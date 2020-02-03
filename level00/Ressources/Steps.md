# Level 00

First, we see in the video that we have to search all files owned by `flag00`.

We search for files for specific users with `find / -user USER`. To hide errors we add at the end `2>/dev/null`.  Filter out some expressions with `grep -v XXX`.

The `/rofs` are the same files, just mounted for read only.

```bash
cat /usr/sbin/john
cdiiddwpgswtgt
```

The password is not working. From the video, we know we might have to decode a ceasar hash, https://www.dcode.fr/chiffre-cesar with a 11 key.

Decoded rot: `nottoohardhere`.

```bash
getflag
Check flag.Here is your token : x24ti5gi3x0ol2eh4esiuxias
```

