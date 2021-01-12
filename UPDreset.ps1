New-EventLog –LogName Application –Source 'UPD' -ErrorAction SilentlyContinue
while(Get-PnpDevice -InstanceId "USB\VID_03F0&PID_3917\5*" -Status "Error" -ErrorAction SilentlyContinue){
Write-EventLog -LogName "Application" -Source "UPD" -EventID 7210 -EntryType Warning -Message "Urządzenie USB\VID_03F0&PID_3917 wymaga inicjalizacji." -Category 1 -RawData 10,20
Get-PnpDevice -InstanceId "USB\VID_03F0&PID_3917\5*" -Status "Error" -ErrorAction SilentlyContinue| Disable-PnpDevice -Confirm:$false -ea SilentlyContinue
sleep(10)
Get-PnpDevice -InstanceId "USB\VID_03F0&PID_3917\5*" -Status "Error" -ErrorAction SilentlyContinue | enable-PnpDevice -Confirm:$false -ea SilentlyContinue
}
Write-EventLog -LogName "Application" -Source "UPD" -EventID 7210 -EntryType Information -Message "Urządzenie USB\VID_03F0&PID_3917 zostało poprawnie zainicjowane." -Category 1 -RawData 10,20
