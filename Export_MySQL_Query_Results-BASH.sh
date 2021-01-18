#!/bin/bash
# This script was designed to export query results from a MySQL schema and then move the generated file to a SMB shared folder using Bash in Linux
# 
# Filename Vars Setup
filenameHeader="QueryResults-"
filenameDateTime=$(date +--%Y-%m-%d--%H-%M-%S)
filenameFooter="-FromMySQL-"
filenameExtension=".csv"
# Query execution + Results file creation
mysql -h 192.168.0.XXX -u username -ppasword schema < /SQL_QUERY.sql > /$filenameHeader$filenameDateTime$filenameFooter$filenameExtension
# Results file filesize check (to avoid moving an empty / faulty file) (leave this when it's a fact that you would always get a lot of data)
NEWFILESIZE=$(stat -c%s "/$filenameHeader$filenameDateTime$filenameFooter$filenameExtension")
if [ $NEWFILESIZE -gt 10576 ]; then
		#Mounting remote SMB folder
        mount -t cifs //192.168.0.YYY/SMBFOLDER /MOUNTEDFOLDER -o "username=USERNAME,password=PASSWORD"
		#Moving query results
        mv /$filenameHeader$filenameDateTime$filenameFooter$filenameExtension /MOUNTEDFOLDER/$archivo$fechahora$extension
fi
