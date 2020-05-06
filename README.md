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

## Limits

```bash
docker update --cpu-shares 1024 --memory 50m  --memory-swap 50m  --pids-limit 1024 softplc-level-high-switch
docker update --cpu-shares 1024 --memory 300m --memory-swap 300m --pids-limit 1024 softplc-node-red
docker update --cpu-shares 1024 --memory 50m  --memory-swap 50m  --pids-limit 1024 softplc-inlet-valve
docker update --cpu-shares 1024 --memory 50m  --memory-swap 50m  --pids-limit 1024 softplc-outlet-valve
docker update --cpu-shares 1024 --memory 50m  --memory-swap 50m  --pids-limit 1024 softplc-level-low-switch
docker update --cpu-shares 1024 --memory 100m --memory-swap 100m --pids-limit 1024 softplc-openplc
docker update --cpu-shares 1024 --memory 50m  --memory-swap 50m  --pids-limit 1024 softplc-mosquitto
docker update --cpu-shares 1024 --memory 700m --memory-swap 700m --pids-limit 1024 softplc-scadabr
```