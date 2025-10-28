# 🖥️ Server Stats — Linux Server Performance Analyzer

`server-stats.sh` is a lightweight Bash script that provides a detailed overview of your Linux server’s performance.  
It displays important metrics like **CPU usage**, **memory usage**, **disk usage**, and the **top processes** consuming system resources.  
It also includes optional system info such as **OS version**, **uptime**, and **failed login attempts**.

---

## 📊 Features

- ✅ **CPU Usage** — total usage in percentage  
- ✅ **Memory Usage** — used, free, and usage percentage  
- ✅ **Disk Usage** — total, used, available, and usage percentage  
- ✅ **Top 5 Processes by CPU Usage**  
- ✅ **Top 5 Processes by Memory Usage**  
- ⚙️ *(Optional/Stretch Features)*  
  - OS version and kernel info  
  - System uptime and load average  
  - Logged-in users count  
  - Failed SSH login attempts (if logs available)

---

## 🧰 Requirements

This script works on all major Linux distributions including **Ubuntu**, **Debian**, **CentOS**, **RHEL**, and **Fedora**.

### Dependencies

The following tools must be available (most are preinstalled by default):

- `bash`
- `top`
- `ps`
- `free`
- `df`
- `grep`, `awk`, `cut`, `bc`
- `journalctl` *(optional — for SSH login logs)*

To install missing dependencies:
```bash
# For Ubuntu/Debian
sudo apt install procps coreutils bc util-linux systemd -y

# For CentOS/RHEL/Fedora
sudo yum install procps-ng coreutils bc util-linux systemd -y


🚀 How to Run the Project

Follow these steps to set up and execute the script:

1️⃣ Clone or Download the Repository
git clone https://github.com/ketandabhi87/Server-Performance-Stats
cd Server-Performance-Stats


Or download the script directly:

wget https://raw.githubusercontent.com/ketandabhi87/Server-Performance-Stats/main/server-stats.sh

2️⃣ Make the Script Executable
chmod +x server-stats.sh

3️⃣ Run the Script
./server-stats.sh


💡 Note: You do not need root privileges to run the script.
However, some sections (like failed login attempts) may show more details when executed with sudo.
