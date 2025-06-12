# Pi-hole Docker Setup

Dieses Projekt erleichtert die Installation von Pi-hole auf einem Raspberry Pi mithilfe von Docker.

## Voraussetzungen
- Raspberry Pi OS mit statischer IP-Adresse
- Docker und Docker Compose (werden vom Installationsskript installiert, falls nicht vorhanden)

## Erste Schritte
1. Repository klonen
2. Im Ordner `docker/.env` Zeitzone und Web-Admin-Passwort anpassen
3. Installationsskript ausführen:
   ```bash
   ./setup/install.sh
   ```
4. Nach Abschluss läuft Pi-hole unter der IP des Raspberry Pi auf Port 80.

## DNS im Router einrichten
Stelle deinen Router so ein, dass er als DNS-Server die IP-Adresse des Raspberry Pi verwendet. Dadurch filtern alle Geräte im Netzwerk ihre DNS-Anfragen über Pi-hole.

## Backups
Das Skript `backups/cron-backup.sh` erstellt ein komprimiertes Backup der Verzeichnisse `/etc/pihole` und `/etc/dnsmasq.d`. Lege es in einen täglichen Cron-Job, um regelmäßige Sicherungen zu erhalten.

## Troubleshooting
- **Logs anzeigen**: `docker logs pihole`
- **Container neu starten**: `docker restart pihole`
- **Ports belegt**: Stelle sicher, dass kein anderer Dienst die Ports 53 oder 80 verwendet.

