# borg_backupninja
Handlers and jobs for using borgbackup with backupninja

This is documentation and scripts for using Borg backups with backupninja. This relies heavily on the work of [Jon Goldberg](https://github.com/PalanteJon), [Benzhaomin](https://0xacab.org/Benzhaomin), and [Guillaume Subiron](https://github.com/maethor).

The files borg, borglocal, borg.helper, and borglocal.helper should be placed in /usr/share/backupninja, permissions 644, owned by root:root.

The files 70-76 are example backupninja jobs, which would go in /etc/backup.d, permissions 600, owned by root:root.

Job 70 is for backing up to a usb drive, which will be mounted at the beginning of every job and unmounted at the end.
Necessary variables to change: device uuid, filesystem type, included and excluded files, directory to mount the usb drive to, passphrase

Job 71 is for backing up to either a local folder or a folder accessible by ssh on a remote host.
Necessary variables to change: included and excluded files, directory to put the backups in, host, ssh user, passphrase

Jobs 75 and 76 are for checking the viability of the job 70 and 71 backups respectively, and require coping over the variables from those jobs.

Please change the passphrase variable in these jobs to something other than "PASSPHRASE", or leave it empty, which will turn off encryption.
