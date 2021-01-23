#!/bin/bash
#
# Script that should be executed by a cron job to re-run certbot and generate 
# new certificates for HTTPS server on AWS

# Initial Steps Taken to Create First HTTPS Certificates:
# https://gist.github.com/devlinjunker/f46d95ba6fb5a91cec93c2f24a3466d2#file-https-setup-md


# TODO:
# 
# Call sudo certbot -i apache -a manual --preferred-challenges dns -d dev-junk.com -d devsjunk.com

# From Manual process:
# 1. Did Above (with www)
# 2. Y/N Confirm Question
# 3. Each domain has TXT record output, enter between each

# TODO: Add DNS TXT Resource Records to Google Domain Settings
# Should we just email these to do manually?