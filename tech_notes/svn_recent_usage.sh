#!/usr/bin/bash

# Show recent svn log activity count and recent-author list per-repo
# Change SVN_ROOT and START_DATE to match your environment

SVN_ROOT=/var/svn/repos
START_DATE=2021-01-01

for repo in $(ls $SVN_ROOT)
do
   if [ -d "$SVN_ROOT/$repo/db" ]
   then
     num=0
     author_lines=$(svn log -r {$START_DATE}:HEAD file://$SVN_ROOT/$repo --xml | egrep '<author>')
     num=$(echo "$author_lines" | wc -l)
     if [[ $num -gt 1 ]]
     then
         echo "$repo svn_log count from $START_DATE = $num"
         echo "$author_lines" | sort --unique
         echo "====================================================="
     fi
   fi
done
