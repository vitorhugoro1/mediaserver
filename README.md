# Personal Media Server

I am building this "setup" to stop subscribe to more services who I really use sometimes and don't really need to pay to they every month a fee.

**This project is just my personal setup for media server, who still under construction.**

## Environment

My setup runs on a small desktop build with Ubuntu Server as the OS. The specs of the machine are listed below:

- Motherboard: ASRock H310CM-HG4
- CPU: Intel Core i5-9400F
- GPU: NVIDIA Quadro P400 2GB
- RAM: 8GB DDR4 Kingston 2666MHz
- 1x SSD Kingston 256GB
- 1x External HDD Seagate 4TB

## Services and Tools

The services run on Docker and are defined in the compose files of this repository. I use [Dockhand](https://github.com/Finsys/dockhand) to manage the stacks. These are the services running on my "server":

### Media

- [Jellyfin](https://jellyfin.org/)
- [Jellyseerr](https://github.com/Fallenbagel/jellyseerr) - media requests
- [Radarr](https://radarr.video/) - movies management
- [Sonarr](https://sonarr.tv/) - series management
- [Bazarr](https://wiki.bazarr.media/) - subtitles
- [Prowlarr](https://prowlarr.com/) - indexers, with custom definitions in `prowlarr/`
- [Byparr](https://github.com/ThePhaseless/Byparr) - Cloudflare challenge solver
- [QBittorrent](https://www.qbittorrent.org/) - torrent downloads

### Network

- [Gluetun](https://github.com/qdm12/gluetun-wiki/tree/main) - VPN client (ProtonVPN with WireGuard and port forwarding) used by QBittorrent, Prowlarr and Byparr
- [Cloudflared](https://github.com/cloudflare/cloudflared)
- [Tailscale](https://tailscale.com/)
- [Pi-hole](https://pi-hole.net/) - DNS server and ad blocker
- [Nginx Proxy Manager](https://nginxproxymanager.com/) - reverse proxy (`docker-compose.nginx.yml`)

### Automation

- [Home Assistant](https://www.home-assistant.io/)
- [n8n](https://n8n.io/) - workflow automation in queue mode, with Redis, a worker and external task runners (`docker-compose.n8n.yml`)

### Monitoring

- [Grafana](http://grafana.com) - dashboards, including the n8n ones in `monitoring/grafana/`
- [InfluxDB](https://www.influxdata.com) - metrics storage
- [qBittorrent Exporter](https://github.com/vitorhugoro1/qbittorrent-exporter) - QBittorrent metrics (`monitoring/docker-compose.yml`)

### Management

- [Dockhand](https://github.com/Finsys/dockhand) - Docker stacks manager

## Install commands

To simple install the services, even without the CasaOS UI, I have a custom Makefile with some simplified commands to make the setup run quick without need to make something complex:

```bash
# update and recreate all images
make update

# pull most recents images
make update-images

# force build and recreate all docker-compose services
make recreate
```

### Monitoring

To configure the monitoring setup, I use [Telegraf](https://docs.influxdata.com/telegraf/v1/) from InfluxData which uses InfluxDB through an Grafana setup to visualize my processes data, like CPU, Memory, Storage, Docker, etc.

This setup can be way extended than are now, but I just use to a simple and straightforward setup to monitor my machine which can be easily replicated to another machine if I need.

- [How to install Telegraf](https://docs.influxdata.com/telegraf/v1/install/#download-and-install-telegraf)
- [How to generate a custom config file based on which plugins I want](https://docs.influxdata.com/telegraf/v1/commands/#run-telegraf-but-only-enable-specific-plugins)

## References

Most my setup is make using this channels and blogs as reference to inspiration or ideas:

- [Everything Smart Home](https://www.youtube.com/@EverythingSmartHome)
- [Christian Lempa](https://www.youtube.com/@christianlempa)
- [Hardware Haven](https://www.youtube.com/@HardwareHaven)
- [Tech Hut](https://www.youtube.com/@TechHut)
- [Techno Tim](https://www.youtube.com/@TechnoTim)
- [Wolfgangs Channel](https://www.youtube.com/@WolfgangsChannel)

## Future updates

- [ ] Use Proxmox as OS
- [ ] Automate even the OS setup with Ansible
- [x] Add a new main server as Zimaboard or Dell Optiplex Micro
- [ ] Automate Jellyfin and Home Assistant initial setup
- [ ] Organize the contents of automations
- [x] Add newtwork layer with DNS Server such like PiHole
