#!/bin/bash
TODAY=`date '+%F'`
TODAY=`echo "$TODAY" | sed -e 's/^  *//g'`
TODAY=`echo "$TODAY" | sed -e 's/  *$//g'`
TODAY=`echo "$TODAY" | sed s/"\n"//g`
TODAY=`echo "$TODAY" | sed s/"'"//g`
TODAY=`echo $TODAY`
echo $TODAY
YDAY=`date -d '1 days ago' '+%F'`
YDAY=`echo "$YDAY" | sed -e 's/^  *//g'`
YDAY=`echo "$YDAY" | sed -e 's/  *$//g'`
YDAY=`echo "$YDAY" | sed s/"\n"//g`
YDAY=`echo "$YDAY" | sed s/"'"//g`
YDAY=`echo $YDAY`
echo $YDAY


id=1
until [ $id -eq 600 ]

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
goal=`mysql -uroot -pMalmen1203 Shukei_development -e "select check_at from timestores where idm = '$card' and check_at between '$YDAY 05:00:00' and '$TODAY 04:59:00' order by check_at DESC limit 1"`
goal=`echo "$goal" | sed s/check_at//g`
goal=`echo "$goal" | sed s/"\n"//g`
goal=`echo $goal`
goal=$mae$goal$ushiro
echo $goal
mysql -u root -pMalmen1203 Shukei_development -e "update kintais set ytaisha =$goal where idm = '"$card"'"
#mysql -u root -pMalmen1203 Shukei_development -e "update kintais set monthly =sum*1.1 where idm = '"$card"'"
id=$((id + 1))
echo $id
done

curl -X POST -H "X-ChatWorkToken: 66496d47070398f1824d380bbebbcdfe" -d "body=[To:580445][To:666483][To:1204969]前日帰宅時間が更新されました" "https://api.chatwork.com/v1/rooms/31545163/messages"
