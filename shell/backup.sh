#!/bin/bash
#mysql -u root -pMalmen1203 Shukei_development -e "truncate table timestores"
#mysql -u root -pMalmen1203 Shukei_development -e "truncate table test"

mysql -u root -pMalmen1203 Shukei_development -e "update kintais set ytaisha = taisha;";
