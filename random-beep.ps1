<# 
	Interfacing with the [console], this script performs a 'system beep' with a pitch between 750 and 1500, and the time span is between .25 and 6 seconds
#>
# Change below values to determine the upper and lower limit to the pitch of the system beep

$lower_pitch = 750
$upper_pitch = 1500

# Change below values to determine the range (in seconds) random times between each system beep

$lower_pause = .25
$upper_pause = 6

# Writes a message to the screen, then starts another fork of Powershell as a 'hidden' window that actually executes the payload of beeps.
# To end, you must locate the Powershell instance in Task Manager or w/ get-process to end (rebooting the system also works)
Write-Host "Starting 'Troublemaker'... : )"
Start-Sleep -Seconds 1
Start-Process -WindowStyle Hidden powershell.exe '
    $HOST.UI.RawUI.WindowTitle="Troublemaker : ] "
    while($true)
    {
	    write-Host -ForegroundColor green "Beep"
	    [console]::beep((get-random -Minimum $lower_pitch -Maximum $upper_pitch),500) # 500 is the length of the 'beep'. Could be randomized if wanted
	    start-sleep -Seconds (Get-Random -Minimum $lower_pause -Maximum $upper_pause)
    }
'
