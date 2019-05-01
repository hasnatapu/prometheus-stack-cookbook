# Prometheus stack Chef Cookbook

This Cookbook installs and coonfigures the following (on CentOS):

* Docker service
* node_exporter service
* cadvisor service
* Prometheus container
* Grafana container

Prometheus automatically scrapes local `node_exporter` and `cadvisor` metrics.

Grafana automatically adds `Prometheus` datasource and provisions `Node Exporter Full` dashboard.

## Disclaimer

* Grafana dashboard password is provided in plain text and provided via environment variables to Docker container.

* `node_exporter` and `cadvisor` are distributed as binaries. It would be nice to make RPM packages for systemd services.