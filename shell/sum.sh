#!/bin/bash
mysql -u root -pMalmen1203 Shukei_development -e "update archive t1, kintais t2 set t1.worktime = t2.sum where t1.employee_id = t2.employee_id"
