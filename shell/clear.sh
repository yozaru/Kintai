#!/bin/bash
#mysql -u root -pMalmen1203 Shukei_development -e "truncate table timestores"
#mysql -u root -pMalmen1203 Shukei_development -e "truncate table test"

#昨日の日付を取得
TODAY=`date '+%F' -d '1 days ago'`
TODAY=`echo "$TODAY" | sed -e 's/^  *//g'`
TODAY=`echo "$TODAY" | sed -e 's/  *$//g'`
TODAY=`echo "$TODAY" | sed s/"\n"//g`
TODAY=`echo "$TODAY" | sed s/"'"//g`
TODAY=`echo $TODAY`
echo $TODAY
mysql -u root -pMalmen1203 Shukei_development -e "delete from timestores WHERE check_at between '$TODAY 00:00:00' and '$TODAY 23:59:59'";
