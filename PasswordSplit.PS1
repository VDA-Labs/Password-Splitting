$Split = @()
$UserObjs = @()
$UsernamePass = @()
$PasswordListPath = 'C:\Temp\*.txt'
$CompanyEmailDomain = "@company.com"
$ExportPath = "C:\Temp\Company.CSV"

$UsernamePass = Select-String -Path $PasswordListPath  -Pattern $CompanyEmailDomain | Select-Object -ExpandProperty Line
$List = $UsernamePass
$UserObjs = $List | ForEach-Object {
   $split = $_ -split ":",3
   [PSCustomObject]@{Line = $split[0]; Username = $split[1]; Password = $split[2]; }
}
$UserObjs | Export-CSV -Path $ExportPath
