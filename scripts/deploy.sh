#!/bin/sh
# Deploy to FTP server
set -e

# Set env variables beforehand
#   FTP_URL
#   FTP_USER
#   FTP_PASSWORD
if [ -z "${FTP_URL}" ] || [ -z "${FTP_USER}" ] || [ -z "${FTP_PASSWORD}" ]; then
    echo "Please set FTP_URL, FTP_USER, and FTP_PASSWORD"
    exit 1
fi

FTP_SYNC_ROOT="_site/"
if [ ! -d "$FTP_SYNC_ROOT" ]; then
    echo "Website not built"
    exit 1
fi

FTP_REMOTE_ROOT="nova_html/"

URL="ftp://$FTP_USER:$FTP_PASSWORD@$FTP_URL"
lftp -c "set ftp:list-options -a;
open '$URL';
lcd $FTP_SYNC_ROOT;
cd $FTP_REMOTE_ROOT;
mirror --reverse \
       --delete \
       --verbose"
