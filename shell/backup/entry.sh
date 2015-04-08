#!/bin/bash
id=2
until [ $id -eq 254 ]
do
#timestoresテーブルのidm値を変数に代入
#card=`'use Shukei_development;select idm from kintais where id = '"$id"''|mysql -u root -pMalmen1203`
card=`mysql -u root -pMalmen1203 Shukei_development -e "select idm from kintais where id = '"$id"'"`

card=`echo "$card" | sed -e 's/^  *//g'`
card=`echo "$card" | sed -e 's/  *$//g'`
card=`echo "$card" | sed s/idm//g`
card=`echo "$card" | sed s/"\n"//g`
card=`echo "$card" | sed s/"'"//g`

#idm値が一致する値の中で5時以降で一番早い数字を入れ、フラグをたてる
#entry=`echo 'use Shukei_development;select check_at from timestores where idm = '"$card"' limit 1'|mysql -u root -pMalmen1203`
#entry=`echo 'use Shukei_development;select check_at from timestores where trim(idm) = '"$card"' limit 1'|mysql -u root -pMalmen1203`
#entry=`echo 'use Shukei_development;select check_at from timestores where idm = '"$card"''|mysql -u root -pMalmen1203`

entry=`echo 'use Shukei_development;select check_at from timestores where idm = '"$card"''`
echo $entry
id=$((id + 1))
echo $id
done
