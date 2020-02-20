# soft-plc

## OpenPLC

* WebUI runs on `http://localhost:8080`.
* Admin account: `openplc:openplc`.

## OpenPLC Editor

```sh
cd openplc-editor
xhost +
docker-compose up
xhost -
```

* Project folder mounted on `/root/projects`.
* LD project provided was created following the [OpenPLC - Creating your first
  project] (https://www.openplcproject.com/reference-your-first-project) guide.

## ScadaBR

* WebUI runs on `http://localhost:9090/ScadaBR`.
* Admin account: `admin:admin`.

## Node Red

* WebUI runs on `http://localhost:1883/ScadaBR`.
* Mqtt Server is `mosquitto:1883`.
