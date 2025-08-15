# DNS - DeeezNuddS 💔😩

## Topologi
- **VM1 (DNS + DHCP)**: IP `192.168.56.10`, domain `deeznuds.local`
- **VM2 (HTTP Server)**: IP `192.168.56.20`, Apache di port 8080
- **VM3 (Client)**: DHCP (range `192.168.56.50-100`), akses domain
- **VM4 (Reverse Proxy + Firewall)**: IP `192.168.56.40`, Nginx reverse proxy ke VM2

---

## Struktur Repo
```
.
|-- README.md
|-- VM1_DNS
│   |-- db.deeznuds.local
│   |-- dhcpd.conf
│   |-- interfaces
│   |-- named.conf.local
|-- VM2_HTTP
│   |-- apache_setup.sh
│   |-- interfaces
|-- VM3_Client
│   |-- interfaces
│   |-- resolve.conf
│   |-- Script.py
|-- VM4_RevProx
    |-- default
    |-- firewall_setup.sh
    |-- interfaces
```

---

## Cara Setup
1. **VM1 - DNS + DHCP**
   - `apt install bind9 isc-dhcp-server`
   - Copy file `named.conf.local`, `db.deeznuds.local`, `dhcpd.conf`
   - Restart services:
     ```bash
     systemctl restart bind9
     systemctl restart isc-dhcp-server
     ```

2. **VM2 - HTTP**
   - Jalankan:
     ```bash
     bash apache_setup.sh
     ```

3. **VM4 - Reverse Proxy + Firewall**
   - Install NGINX: `apt install nginx -y`
   - Ganti config `nginx.conf` → restart:
     ```bash
     systemctl restart nginx
     ```
   - Jalankan firewall script:
     ```bash
     bash ufw_script.sh
     ```

4. **VM3 - Client**
   - Pastikan DHCP aktif atau set DNS ke `192.168.56.10`
   - Jalankan:
     ```bash
     python3 client.py
     ```

> Yeah TS written by AI, I'm too lazy 
