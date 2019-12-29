Create a virtual machine with the ISO, linux max 2.X (max version).

level00:level00
Add tcp port forwarding with 4242

on host: ssh level00@localhost -p 4242


We search for flagXX passwords, with flagXX is the username

flag00: Search all files that have the user autorisation
find / -user flag00 2>/dev/null | grep -v "/proc"

find from root with user, redirects errors to hide them and removing files starting with /proc.
file has last r when doing the ls -l, so we can read it
cat file
Then we do rot of 11 (using online https://www.dcode.fr/rot-cipher

He get nottoohardhere

su flag00
nottoohardhere

getflag x24ti5gi3x0ol2eh4esiuxias
```
flag00@SnowCrash:~$ getflag
Check flag.Here is your token : x24ti5gi3x0ol2eh4esiuxias
```
exit to get back to previous user



su level01:x24ti5gi3x0ol2eh4esiuxias
FLAG00 to FLAG01
checking /etc/passwd file
https://www.cyberciti.biz/faq/understanding-etcpasswd-file-format/

we can log /etc/passwd
we get an encrypted password 42hDRfypTqqnw, other users password have an x meaning they are in /etc/shadow

we copy the file locally with scp,
john passwd

...get the pwd by bruteforce
https://null-byte.wonderhowto.com/how-to/hack-like-pro-crack-user-passwords-linux-system-0147164/

```
flag01@SnowCrash:~$ getflag
Check flag.Here is your token : f2av5il02puano7naaf6adaaf
```

su level02:f2av5il02puano7naaf6adaa

we have a pcap file, we can decode it




su level03:
ls -l, we see a flag03 user on the file
file level03
we know its executable
trying nm, strings
strings show clue
Now that means if we can replace the file, we can use the user auth,
cp /bin/getflag ./echo
export PATH={pwd}:$PATH
```
level03@SnowCrash:~$ ./level03
Check flag.Here is your token : qi0maab88jeaj46qoumi7maus
```

