#!/bin/bash
cd /home/csv
#TARGET_NAME="log20150320093125001.txt"
TARGET_NAME="log*txt"
file=$TARGET_NAME
for TXT in ${file}
do
year=`echo $TXT | cut -c4-7`
month=`echo $TXT | cut -c8-9`
day=`echo $TXT | cut -c10-11`
hour=`echo $TXT | cut -c12-13`
min=`echo $TXT | cut -c14-15`
sec=`echo $TXT | cut -c16-17`
#printf "HOME=[%s]\n" $HOME
check_at=`printf "%4s-%2s-%2s-%2s:%2s:%2s" "$year" "$month" "$day" "$hour" "$min" "$sec"`
#check_at=`printf "0000 "`
echo $check_at
#check_at=`echo $TXT | cut -c4-15`
idm=`cat $TXT | awk 'NR==4 {print $0}'`
mysql -u root -pMalmen1203 Shukei_development -e "INSERT INTO timestores (check_at,idm) values ('"$check_at"','"$idm"')"
#mysql -u root -pMalmen1203 Shukei_development -e "INSERT INTO timestores (check_at,idm) VALUES ('2015-03-20 09:31:25','aaaaaaa')"
mv $TXT /home/csv/old/
done

