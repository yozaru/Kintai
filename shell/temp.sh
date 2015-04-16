#!/bin/bash
id=2
until [ $id -eq 254 ]

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
goal=`mysql -uroot -pMalmen1203 Shukei_development -e "select check_at from timestores where idm = '$card' and check_at between '2015-04-13 05:00:00' and '2015-04-14 04:59:00' order by check_at DESC limit 1"`
goal=`echo "$goal" | sed s/check_at//g`
goal=`echo "$goal" | sed s/"\n"//g`
goal=`echo $goal`
goal=$mae$goal$ushiro
echo $goal
mysql -u root -pMalmen1203 Shukei_development -e "update kintais set ytaisha =$goal where idm = '"$card"'"
id=$((id + 1))
echo $id
done
