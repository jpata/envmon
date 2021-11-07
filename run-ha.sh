#!/bin/bash

sudo docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -e TZ=EET \
  -v /mnt/data/homeassistant:/config \
  --network=host \
  ghcr.io/home-assistant/raspberrypi3-homeassistant:stable

sudo docker run -d \
  --name="influxdb" \
  --restart unless-stopped \
  -p 8086:8086 \
  -p 8083:8083 \
  -v /mnt/data/influxdb/:/var/lib/influxdb \
  influxdb:1.8

sudo docker run -d -p 3000:3000 \
  --name="grafana" \
  -v /mnt/data/grafana/:/var/lib/grafana \
  grafana/grafana
