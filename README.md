# soft-plc

## OpenPLC

WebUI runs on `http://localhost:8080`
Admin account: `openplc:openplc`

## OpenPLC Editor

```sh
cd openplc-editor
xhost +
docker-compose up
xhost -
```

## ScadaBR

WebUI runs on `http://localhost:9090/ScadaBR`
Admin account: `admin:admin`

## Node Red

WebUI runs on `http://localhost:1883/ScadaBR`
Mqtt Server is `mosquitto:1883`