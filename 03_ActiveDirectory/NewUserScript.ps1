# Import Active Directory module
Import-Module ActiveDirectory

# Define the Organizational Unit (OU) where users will be created
$OU = "OU=Employees,DC=mauri,DC=local"

# Import the CSV file
$Users = Import-Csv -Path "C:\Users\Administrator\Desktop\NewUsers.csv"

# Loop through each user in the CSV file
foreach ($User in $Users) {
    # Extract values from CSV
    $FirstName = $User.First
    $LastName = $User.Last
    $EmployeeID = $User."Employee number"  # Handles spaces in column name

    # Ensure all required fields are present
    if (-not $FirstName -or -not $LastName -or -not $EmployeeID) {
        Write-Host "Skipping user: Missing required fields → $FirstName $LastName"
        continue
    }

    # Generate a SamAccountName (first letter of first name + first four letters of last name)
    if ($LastName.Length -ge 4) {
        $SamAccountName = ($FirstName.Substring(0,1) + $LastName.Substring(0,4)).ToLower()
    } else {
        $SamAccountName = ($FirstName.Substring(0,1) + $LastName).ToLower()
    }

    # Set User Principal Name (UPN)
    $UPN = "$SamAccountName@mauri.local"

    # Check if the user already exists in AD
    if (Get-ADUser -Filter {SamAccountName -eq $SamAccountName}) {
        Write-Host "User $SamAccountName already exists, skipping..."
        continue
    }

    # Create the user in Active Directory
    New-ADUser -Name "$FirstName $LastName" `
               -SamAccountName $SamAccountName `
               -GivenName $FirstName `
               -Surname $LastName `
               -UserPrincipalName $UPN `
               -Path $OU `
               -AccountPassword (ConvertTo-SecureString "P@ssword1" -AsPlainText -Force) `
               -Enabled $true

    Write-Host "Created user: $FirstName $LastName ($SamAccountName)"
}

Write-Host "User creation process completed."
