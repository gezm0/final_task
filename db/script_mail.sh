#!/usr/bin/bash

# config start
pid=/var/run/script_mail.pid		# name for pid file
files=/local/backups			# name of directory for monitoring
rcpt="root@localhost"			# recipient of message
sender="nightwatch@localhost"		# sender of message
subj=$(echo "Report on ${files}")	# subject string for message
body=/tmp/script_mail.tmp		# temporary body of message
max_files=3				# maximum number of files for trigger
max_size=1000				# maximum size of files for trigger (in bytes)
sleep_time=300				# time between executions of script (in seconds)

### WARNING ###
# you need to measure YOUR empy directory size for correct work of this script
# size of empty directory in my case because of metadata

meta_size=3072

# config end

# run in infinite loop

while true
do

# make pid file
echo $$ > ${pid}

# count current number of files and size of those files
cur_num=$(ls -l ${files} | grep "^-" | wc -l)

## and size of those files
# count size of directory with metadata
cur_size=$(du -b ${files} | cut -f1)

# substraction size of metadata
let cur_size="${cur_size} - ${meta_size}"

# check if message temporary body already exists
if [ -f ${body} ]
then
# silently remove it if exists
	rm -f ${body}
fi

# check condition for number of files and append information to message body if fits
if [ ${cur_num} -gt ${max_files} ] 
then
	echo "There are already" ${cur_num} "files in" ${files} >> ${body}
fi

# check condition for size of files and append information to message body if fits
if [ ${cur_size} -gt ${max_size} ]
then
	echo "There are already" ${cur_size} "bytes in" ${files} >> ${body}
fi

# check if message temporary body exists
if [ -f ${body} ]
then
# if exists then add timestamp and send it out
	echo "---" >> ${body}
	echo "Generated at" `date` >> ${body}
	mail -s "${subj}" -r ${sender} ${rcpt} < ${body}
else
# if not exist then report to console that nothing to do
	echo "Nothing to do"
fi

# silently remove temporary body of message
rm -f ${body}

# repeat every n seconds
sleep ${sleep_time}

# exit from infinite loop
# by the truth there is no exit except death
done
