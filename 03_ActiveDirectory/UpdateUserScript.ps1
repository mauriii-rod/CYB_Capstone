# Define the OU path
$OU = "OU=Employees,DC=mauri,DC=local"

# Define the output file path
$OutputFile = "C:\Users\Administrator\Desktop\UpdatedEmployees.txt"

# Ensure the output directory exists
if (!(Test-Path "C:\Users\Administrator\Desktop")) {
    New-Item -ItemType Directory -Path "C:\Users\Administrator\Desktop"
}

# Get all users from the Employee OU and export to a text file
Get-ADUser -SearchBase $OU -Filter * -Property Name, SamAccountName, EmployeeID | 
    Select-Object Name, SamAccountName, EmployeeID | 
    Format-Table -AutoSize | Out-File -Encoding utf8 $OutputFile
