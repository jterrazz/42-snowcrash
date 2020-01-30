# Level 00

We cat all users with `cat /etc/passwd`.

We can search for files for specific users with `find / -user USER`.

- To hide errors we add at the end `2>>/dev/null`
- `grep -v XXX` to filter out some expressions

The `/rofs` are the same files, just mounted for read only.

We have the file `/usr/sbin/john`, from it we can cat a password which is not working: `cdiiddwpgswtgt`

From https://www.dcode.fr/chiffre-cesar we deduct

Decoded rot: `nottoohardhere`