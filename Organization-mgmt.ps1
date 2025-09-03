$excelPath = Read-Host "Enter full path to Excel file"
$excel = New-Object -ComObject Excel.Application
$wb = $excel.Workbooks.Open($excelPath)
$ws = $wb.Sheets.Item(1)

    $row = 2
    while ($ws.Cells.Item($row,1).Text -ne "") {
        $ou = $ws.Cells.Item($row,1).Text
        $group = $ws.Cells.Item($row,2).Text
        $user = $ws.Cells.Item($row,3).Text
        $password = ConvertTo-SecureString "*****" -AsPlainText -Force

        if (-not (Get-ADOrganizationalUnit -LDAPFilter "(name=$ou)" -ErrorAction SilentlyContinue)) {
            New-ADOrganizationalUnit -Name $ou -Path (Get-ADDomain).DistinguishedName -ProtectedFromAccidentalDeletion:$false
        }

        if (-not (Get-ADGroup -Filter "Name -eq '$group'" -ErrorAction SilentlyContinue)) {
            New-ADGroup -Name $group -GroupScope Global -Path "OU=$ou,$((Get-ADDomain).DistinguishedName)"
        }

        if (-not (Get-ADUser -Filter "SamAccountName -eq '$user'" -ErrorAction SilentlyContinue)) {
            New-ADUser -Name $user -SamAccountName $user -Path "OU=$ou,$((Get-ADDomain).DistinguishedName)" `
                -AccountPassword $password -Enabled $true
            Add-ADGroupMember -Identity $group -Members $user
        }
        $row++
    }

    $wb.Close($false)
    $excel.Quit()
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
    Write-Host "Bulk import complete!" -ForegroundColor Green
