#!/bin/bash
#mysql -u root -pMalmen1203 Shukei_development -e "update archive t1, kintais t2 set t1.worktime = t2.sum where t1.employee_id = t2.employee_id"
mysql -u root -pMalmen1203 Shukei_development -e "update kintais t1, test t2 set t1.sum = t2.sum where t1.employee_id = t2.employee_id"
curl -X POST -H "X-ChatWorkToken: 66496d47070398f1824d380bbebbcdfe" -d "body=[To:580445][To:666483][To:1204969]月労働時間が更新されました。" "https://api.chatwork.com/v1/rooms/31545163/messages"
