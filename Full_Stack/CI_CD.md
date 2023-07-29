## Cron

Executing a command on a schedule
https://crontab.guru/

**_github.sh_**

```bash
#! /usr/bin/bash

cd /var/www/app
git pull origin main --ff-only
npm i
```

```bash
crontab -e // show cronjobs

*/2 * * * * sh /var/www/app/github.sh // run every 2 minutes

sudo cat /var/log/syslog | grep CRON // show cronjobs logs
```

## Logging, Streams, Redirection

tail - show the last part of files
head - show the first part of files
less - show one page at a time
cat - show the whole file

stdout - standard output
stdin - standard input
stderr - standard error

```
| - pipe (read)
> - write to file
>> - append to file
< - read from file
2>&1 - redirect both stderr and stdout
```

## Find & Grep

find - search file names
grep - search file contents (& zgrep for compressed files)

```bash
find /bar -name foo.txt

find / -type d -name log

grep -i 'jem' /var/www
ps aux | grep node
```

## Gzip

gzip settings - /etc/nginx/nginx.conf
