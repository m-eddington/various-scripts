Import-Module ActiveDirectory
# Get users from OU
$users = Get-ADUser -Filter * -Properties ObjectGUID, Description -SearchBase "OU=Students,OU=Google,DC=domain,DC=tld"

# does ePPN exist?
function ePPN-check {
foreach ($user in $users) {
if ($user.Description -eq $null) {
Write-host "[CREATING] - Creating ePPN for" $user.userPrincipalName
create-ePPN
		}
else {
Write-Host "[SKIPPING] - ePPN already exists for" $user.userPrincipalName
		}
	}
}

# create ePPN
function create-ePPN {
$newDescription = "$($user.ObjectGUID)@domain.tld"
$removeDash = "-"
$ePPN = $newDescription -replace $removeDash, ""
Set-ADUser -Identity $user.DistinguishedName -Description $ePPN
}

ePPN-check
