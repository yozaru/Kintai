#!/bin/bash
id=1
TODAY=`date '+%F'`
TODAY=`echo "$TODAY" | sed -e 's/^  *//g'`
TODAY=`echo "$TODAY" | sed -e 's/  *$//g'`
TODAY=`echo "$TODAY" | sed s/"\n"//g`
TODAY=`echo "$TODAY" | sed s/"'"//g`
TODAY=`echo $TODAY`
echo $TODAY
until [ $id -eq 300 ]

do
#timestoresテーブルのidm値を変数に代入
card=`mysql -u root -pMalmen1203 Shukei_development -e "select idm from kintais where id = '"$id"'"`

card=`echo "$card" | sed -e 's/^  *//g'`
card=`echo "$card" | sed -e 's/  *$//g'`
card=`echo "$card" | sed s/idm//g`
card=`echo "$card" | sed s/"\n"//g`
card=`echo "$card" | sed s/"'"//g`
card=`echo $card`
mae="'"
ushiro="'"
#idm値が一致する値の中で5時以降で一番早い数字を入れ、フラグをたてる
entry=`mysql -uroot -pMalmen1203 Shukei_development -e "select check_at from timestores where idm = '$card' and check_at >= '$TODAY 05:00:00' order by check_at asc limit 1"`
goal=`mysql -uroot -pMalmen1203 Shukei_development -e "select check_at from timestores where idm = '$card' and check_at >= '$TODAY 05:00:00' order by check_at desc limit 1"`
entry=`echo "$entry" | sed s/check_at//g`
goal=`echo "$goal" | sed s/check_at//g`
entry=`echo "$entry" | sed s/"\n"//g`
goal=`echo "$goal" | sed s/"\n"//g`
entry=`echo $entry`
goal=`echo $goal`
entry=$mae$entry$ushiro
goal=$mae$goal$ushiro
echo $entry
echo $goal
mysql -u root -pMalmen1203 Shukei_development -e "update kintais set shusha =$entry where idm = '"$card"'"
mysql -u root -pMalmen1203 Shukei_development -e "update kintais set taisha =$goal where idm = '"$card"'"
id=$((id + 1))
echo $id
done
