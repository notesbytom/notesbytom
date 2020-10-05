#!/usr/bin/python

import datetime
import os.path
import os

# Update these to match your environment, schedule with crontab
dbs = ['db_one','db_two','db_three']
outfolder = '/var/backup/mysql'
numToKeep = 7

mydate = "{:%Y-%m-%d_%H%M}".format(datetime.datetime.now())

for db in dbs:
    # Create New Backup
    outfile = os.path.join(outfolder,'{}_{}.gz'.format(mydate,db))
    cmd = 'mysqldump {} | gzip > {}'.format(db,outfile)
    print('cmd = {}'.format(cmd))
    os.system(cmd)

    # Cleaup Old Backups
    l = [f for f in sorted(os.listdir(outfolder)) if f.endswith('{}.gz'.format(db))]
    print('Num DB Backups for {} = {}'.format(db, len(l)))
    removeList = l[:-numToKeep]
    keepList = l[-numToKeep:]
    for f in removeList:
        cmd = 'rm {}'.format(os.path.join(outfolder,f))
        print(cmd)
        os.system(cmd)
    for f in keepList:
        print('KEEP {}'.format(f))
