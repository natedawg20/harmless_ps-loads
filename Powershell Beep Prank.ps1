<# 
	Beepinator
    Interfacing with the [console], this script performs a 'system beep' with a pitch between 750 and 1500, and a random time between .25 and 6 seconds
    The script runs a new Powershell.exe session as a 'hidden' process
    
#>
Write-Host "Starting 'Troublemaker'... : )"
Start-Sleep -Seconds 1
Start-Process -WindowStyle Hidden powershell.exe '
    $HOST.UI.RawUI.WindowTitle="Beepinator"
    while($true)
    {
        write-Host -ForegroundColor green "Beep"
        [console]::beep((get-random -Minimum 750 -Maximum 1500),(Get-Random -Minimum 200 -Maximum 760))
        start-sleep -Seconds (Get-Random -Minimum .25 -Maximum 6)
    }
'