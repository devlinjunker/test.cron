# Cron Scripts

The scripts in this directory are expected to run via cron jobs, or just scheduled jobs on a server. Read more about cron jobs [here](https://ostechnix.com/a-beginners-guide-to-cron-jobs/).

To View Cron Jobs type `crontab -l`

To Edit Cron Jobs type `crontab -e`

Logs on AWS AMI are found in `/var/log/cron`, this location is configured in `/etc/rsyslog.conf`

## Download Weather (download-weather.sh)
Downloads a satellite image and the current forecast from online APIs

To be scheduled: 8am, 12pm, 4pm, 8pm?

In UTC, this is: 16:00, 20:00, 00:00, 04:00

```
0 16 * * * /bin/bash /home/ec2-user/dev.junk.cron/src/cron/download-weather.sh
0 20 * * * /bin/bash /home/ec2-user/dev.junk.cron/src/cron/download-weather.sh
0 0 * * * /bin/bash /home/ec2-user/dev.junk.cron/src/cron/download-weather.sh
```

## TODO
- Look into anacron: https://www.tecmint.com/cron-vs-anacron-schedule-jobs-using-anacron-on-linux/
    - Runs jobs periodically
    - Assumes computer might be off, so checks once its back on
    - Is this for osx?
