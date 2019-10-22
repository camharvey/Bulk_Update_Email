$Names = Import-CSV -Path C:\Users\Administrator\Documents\Users.csv

foreach ($Name in $Names) 
{
    $User = $Name.firstname
    $Mail = $Name.email
    Write-Host $Mail

    $accounts = @(Get-ADUser -Filter "SamAccountName -like '$User.*'" -Properties mail | Select SamAccountName) 
    switch ($accounts.SamAccountName) {
    "$User.sle.admin" 
        {Set-ADUser -Identity $a[0].SamAccountName -EmailAddress "$Mail+qasleadmin@securelink.com"}
    "$User.sle.user" 
        {Set-ADUser -Identity $a[1].SamAccountName -EmailAddress "$Mail+qasleuser@securelink.com"}
    "$User.sle.vendor"
        {Set-ADUser -Identity $a[2].SamAccountName -EmailAddress "$Mail+qaslevendor@securelink.com"}
    "$User.slink.admin" 
        {Set-ADUser -Identity $a[3].SamAccountName -EmailAddress "$Mail+qaslinkadmin@securelink.com"}
    "$User.slink.user" {Set-ADUser -Identity $a[4].SamAccountName -EmailAddress "$Mail+qaslinkuser@securelink.com"}
    }
}