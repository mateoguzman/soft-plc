# Open PLC Editor

## Running on Windows 

[Run GUI app in linux docker container on windows
host](https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde)

```powershell
& 'C:\Program Files\VcXsrv\vcxsrv.exe' :0 -ac -lesspointer -multiwindow -clipboard -nowgl -swrastwgl -fp "C:\Program Files\VcXsrv\fonts\misc\"
$env:DISPLAY = "10.0.75.1:0.0"
docker-compose up
```
