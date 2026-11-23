# Changelog

PineappleTAK versions for the WiFi Pineapple Mark VII. Newest first.

## 1.0.2
- **Console on every address by default**: the console now listens on all interfaces, so it opens by the Pineapple's host name, its IP on your network or `172.16.42.1`.
- **Console access on the module page and in the console**: choose *All interfaces*, *USB + VPN* or *USB address only* without SSH. The module page lists every address the console answers on.
- **Open PineappleTAK** uses the same host name or IP you used to open the Pineapple page.
- PagerTAK engine 2.3.2.

## 1.0.1
- **Clearer enrollment errors**: says whether the server name could not be looked up (no internet or DNS), the port refused the connection, or nothing answered, instead of "Cannot reach".
- **Log files named after PineappleTAK**: `/tmp/pineappletak-web.log`, `-enroll.log`, `-cert.log` and the others (they were `/tmp/pagertak-*.log`).
- **Module page**: says when a console password is still needed, and why *Start* is greyed out until one is set.
- Fix: the fox hunt in the SIGINT tab needed the `timeout` command, which the Mark VII does not have.
- The Drone Remote ID card mentions Bluetooth only when the Bluetooth tools are installed.

## 1.0.0
- First release: the WiFi Pineapple Mark VII on your TAK Server, with the [PagerTAK](https://github.com/SECT0101/PagerTAK) engine and web console.
- **Pineapple UI module**: install, start, stop, *Start at boot*, web console password, recent activity, reinstall and uninstall. Missing packages (`bash`, `python3-sqlite3`, `ca-bundle`) are installed for you.
- **Position** from a USB GPS (u-blox and other NMEA receivers, clock set from GPS on first fix) or a position picked on the map.
- **Sensors on the Mark VII**: evil-twin watch, SIGINT tables and site survey read PineAP's recon database. Radio control and the fox hunt use PineAP. The system LEDs show status.
- **Evil-twin watch setup in the browser**: *Find networks* lists what recon heard, you tick your networks and save the site.
- **Bluetooth tools from the browser**: the tracker watch offers to install them and warns when no adapter is found.
- **Enrollment** checks the server against your TAK CA first, then the public CA list, so TAK Servers with a public certificate on port 8446 work.
- **Connection checks** work without the `timeout` command and say why a port did not answer.
- Says Pineapple and PineappleTAK everywhere: the web console, its messages, the position report's platform, the UIDs of markers, reports and sensor alerts, and the alert text sent to TAK ("where MKVII-1 heard it").
