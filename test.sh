#!/bin/bash

. ./optconfig.sh

#opt=`opt_new admintools '{ "define=s%": { }, "mail=s@": [ ], "force!": false }'`
eval `opt_new_gen admintools '{ "define=s%": { }, "mail=s@": [ ], "force!": false }' "$@"`
opt=opt_admintools

echo Args: "$@"

if $opt force
then
   $opt vrb 1 "Forcing"
else
   echo "Unforced"
fi

for addr in $($opt mail)
do
   echo "mailx -s Announcement $($addr) <announcement.txt"
done

for key in $($opt define)
do
   val=$($opt define $key)
   echo "Key $key = $($val)"
done
