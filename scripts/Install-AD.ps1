    $domainName = Read-Host "Enter Domain Name"
    $netbios = Read-Host "Enter NetBIOS name"
    $pwd = Read-Host "Enter DSRM password" -AsSecureString
    Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
    Install-ADDSForest -DomainName $domainName -DomainNetbiosName $netbios -SafeModeAdministratorPassword $pwd -Force:$true
