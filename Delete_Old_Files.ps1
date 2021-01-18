# This script was designed to delete files older than 3 days from a specific folder with PowerShell in Windows
#
# Path of folder with files to analyze and delete
$path = "C:\FOLDER"
# Indexing files info
$folderfiles = get-childitem -File -Path $path -recurse
foreach ($folderfile in $folderfiles) 
{ 
	# Deletion of files greater than 3 days older
	if (((New-TimeSpan -Start $folderfile.lastwritetime -End (get-date)).Days) -gt 3) 
	{
		Write-Host $folderfile.FullName
		Remove-Item -Path $folderfile.FullName
	}
}