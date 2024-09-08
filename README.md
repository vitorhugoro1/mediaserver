# Personal Media Server

I am building this "setup" to stop subscribe to more services who I really use sometimes and don't really need to pay to they every month a fee.

**This project is just my personal setup for media server, who still under construction.**

## Environment

My current setup is running in a mid end old laptop who does not have use, then I installed a Ubuntu Server with some custom twearks to make the OS properly work on a notebook, the settings of machine is listed down below:

- Intel Core i5-5300U
- Intel Graphics 5500
- 8GB DDR3L
- 1x SSD Kingston 256GB
- 1x External HDD Seagate 4TB

## Services and Tools

The orchestrate things I installed [CasaOS](https://casaos.io/) with [Portainer](https://www.portainer.io/), where I use the CasaOS has a Dashboard and Monitoring tool and the Portainer to manage the services on Docker. I have the follow services installed on my "server":

- [Jellyfin](https://jellyfin.org/)
- [Jellyseerr](https://github.com/Fallenbagel/jellyseerr)
- [Prowlarr](https://prowlarr.com/)
- [Bazarr](https://wiki.bazarr.media/)
- [Radarr](https://radarr.video/)
- [Sonarr](https://sonarr.tv/)
- [Flaresolverr](https://github.com/FlareSolverr/FlareSolverr)
- [QBittorrent](https://www.qbittorrent.org/)
- [Home Assistant](https://www.home-assistant.io/)
- [Cloudflared](https://github.com/cloudflare/cloudflared)
- [Tailscale](https://tailscale.com/)
- [Grafana](http://grafana.com)
- [InfluxDB](https://www.influxdata.com)
- [Gluetun](https://github.com/qdm12/gluetun-wiki/tree/main)

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
- [ ] Add a new main server as Zimaboard or Dell Optiplex Micro
- [ ] Automate Jellyfin and Home Assistant initial setup
- [ ] Organize the contents of automations
- [ ] Add newtwork layer with DNS Server such like PiHole
