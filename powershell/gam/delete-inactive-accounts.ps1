$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'

function WaitFor-DataTransfer {
    if ((gam print datatransfers status inProgress) | Select-String -Quiet -Pattern "inProgress") {
        Write-Host "Data transfer still in progress.."
        Start-Sleep -Seconds 60
        WaitFor-DataTransfer
    }
    else {
        Write-Host "Data transfer complete - Deleting accounts."
        gam csv C:\output.csv gam delete user ~primaryEmail
    }
}


        Write-Host "Fetching accounts"

gam config csv_output_row_filter "lastLoginTime:date<-180d","creationtime:date<-180d" ou "/Some/OU/Archived" print fields lastlogintime,creationtime > C:\output.csv

        Write-Host "Move accounts to temp-restored"
gam csv C:\output.csv gam update org "/Some/OU/Archived/temp-restored" add ~primaryEmail

        Write-Host "Remove the archive license"
gam csv C:\output.csv gam update user ~primaryEmail archived off

        Write-Host "Enable the account"
gam csv C:\output.csv gam update user ~primaryEmail suspended off

# make user@domain.tld owner of all classrooms from the accounts who will be deleted so they wont be orphaned.
        Write-Host "Getting Classrooms"
gam csv C:\output.csv gam print courses teacher ~primaryEmail fields id > C:\classroom.csv
        Write-Host "Classroom add techer"
gam csv C:\classroom.csv gam course ~id add teacher user@domain.tld
        Write-Host "Classroom make arkiv owner"
gam csv C:\classroom.csv gam update course ~id owner user@domain.tld

        Write-Host "Migrating shared drive files"
gam csv C:\output.csv gam create datatransfer ~primaryEmail gdrive user@domain.tld privacy_level shared

WaitFor-DataTransfer
