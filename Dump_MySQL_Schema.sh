#!/bin/bash
# This script was designed to dump a MySQL schema into a file and then move it to a SMB shared folder using Bash in Linux
#
# Filename Vars Init
filenameHeader="MySQL_BK-"
filenameDateTime=$(date +%y-%m-%d-%H-%M-%S)
filenameFooter="-ProdSchema-"
filenameExtension=".sql"
# MySQL Schema Dump into file
mysqldump -h 192.168.0.XXX -u username -ppassword --routines SCHEMA > /$filenameHeader$filenameDateTime$filenameFooter$filenameExtension
# Mounting SMB Shared Folder
mount -t cifs //192.168.0.YYY /SMBFOLDER -o "username=username,password=password"
# Moving File
mv /$filenameHeader$filenameDateTime$filenameFooter$filenameExtension /SMBFOLDER/$filenameHeader$filenameDateTime$filenameFooter$filenameExtension
