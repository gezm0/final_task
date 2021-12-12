#!/bin/sh

pid=/var/run/script_mail.pid
files=/local/files
rcpt="root@localhost"
sender="nightwatch@localhost"
subj=$(echo "Report on ${files}")
body=/tmp/script_mail.tmp
max_files=3
max_size=1000

echo $$ > ${pid}

cur_num=$(ls -l ${files} | grep "^-" | wc -l)
cur_size=$(du -b ${files} | cut -f1)

if [ -f ${body} ]
then
	rm -f ${body}
fi

if [ ${cur_num} -gt ${max_files} ] 
then
	echo "There are already" ${cur_num} "files in" ${files} >> ${body}
fi

if [ ${cur_size} -gt ${max_size} ]
then
	echo "There are already" ${cur_size} "bytes in" ${files} >> ${body}
fi

echo "---" >> ${body}
echo "Generated at" `date` >> ${body}

mail -s "${subj}" -r ${sender} ${rcpt} < ${body}
