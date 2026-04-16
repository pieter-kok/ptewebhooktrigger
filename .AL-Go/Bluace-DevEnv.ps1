$containerName = "ptewebhook"
$auth = "UserPassword"
$username = "admin"
$securepassword = (ConvertTo-SecureString "admin" -AsPlainText -Force)
$credential = (New-Object System.Management.Automation.PSCredential -ArgumentList ($username, $securepassword))
$licenseFileUrl = Join-Path $PSScriptRoot "7459035.bclicense"

.$PSScriptRoot\localDevEnv.ps1 -containerName $containerName -auth $auth -credential $credential -licenseFileUrl $licenseFileUrl -accept_insiderEula
Add-FontsToBcContainer -containerName $containerName