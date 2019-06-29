#!/bin/sh
# Deploy to FTP server using git-ftp

# Set preferences here
# Some environment variables have to be set separately (FTP_URL, FTP_USER, and FTP_PASSWORD)
FTP_REMOTE_ROOT=nova_html/
FTP_SYNC_ROOT=src/

# Set git-ftp parameters
# Note: the remote-root option is not used, because travis-ci has access
#       to an old version of git-ftp which does not support it; it is
#       therefore appended to the URL
git config git-ftp.url ftp://${FTP_URL}/${FTP_REMOTE_ROOT}
git config git-ftp.user $FTP_USER
git config git-ftp.password $FTP_PASSWORD
git config git-ftp.syncroot $FTP_SYNC_ROOT

# Deploy
# Note: this assumes that `git ftp init` was previously called, i.e. that
#       a .git-ftp.log file exists at the right location on the server
git ftp push -v
