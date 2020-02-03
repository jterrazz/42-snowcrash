# Level 01

The `/etc/passwd` file is a text file that contains essential login information. The password field is usually shown as an `x` to signify it is encrypted in `/etc/shadow` and unaccessible.

> See [here](https://www.cyberciti.biz/faq/understanding-etcpasswd-file-format/)

However the password field for the current flag01 shows an unusual string:

```bash
cat /etc/passwd | grep "flag01" | awk -F':' '{ print $2 }' #42hDRfypTqqnw
```

We copy the line in a file for johntheripper to decrypt it.

```bash
cat /etc/passwd | grep "flag01" > /tmp/file
./john /tmp/file
```

The string is confirmed to be a `DES256` hash and once decrypted :`abcdefg`

```bash
getflag # Check flag.Here is your token : f2av5il02puano7naaf6adaaf
```

