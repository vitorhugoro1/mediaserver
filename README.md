# Personal Media Server

I am building this "setup" to stop subscribe to more services who I really use sometimes and don't really need to pay to they every month a fee.

**This project is just my personal setup for media server, who still under construction.**

## Environment

I am in process to move all this setup to a exclusive machine, who will be responsible by manager and monitor all services. In moment this is running in my personal machine with the follow setup:

- Windows on WSL2 (I know it's sucks)
- Intel Core i5-9400F
- GTX 1660 6GB OC
- 16GB DDR4 2666
- 2x SSD 480GB, 1x SSD 256GB
- 1x HDD 1TB
- 1x External HDD 4TB

## Services and Tools

- Flood
- Jellyseer
- Prowlarr
- Jackett
- Flaresolverr
- Bazarr
- Radarr
- Sonarr
- QBittorrent

## Need transfer to docker or setup

- Jellyfin
- Tdarr
- NextCloud
- Syncthing

## Make commands

```bash
make update # update and recreate all images

make update-images # pull most recents images

make recreate # force build and recreate all docker-compose services
```

## References

**I need find and organize all of them**
