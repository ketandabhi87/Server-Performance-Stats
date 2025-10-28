 🖥️ Server Stats - Basic Linux Server Performance Analyzer

`server-stats.sh` is a simple yet powerful Bash script that provides an overview of your Linux server’s performance.  
It gathers key metrics like **CPU usage, memory, disk utilization, and top processes**, along with optional **system, uptime, and security information**.

---

## 📊 Features

- ✅ Total **CPU usage** (in percentage)
- ✅ **Memory usage** — Free vs. Used with percentage
- ✅ **Disk usage** — Total, Used, Available, and percentage
- ✅ Top **5 processes by CPU** usage
- ✅ Top **5 processes by Memory** usage
- ⚙️ *(Stretch goals)*:
  - OS version and kernel
  - System uptime and load average
  - Logged-in users
  - Recent failed login attempts (if logs available)

---

## 🧰 Requirements

This script works on **most Linux distributions** including Ubuntu, Debian, CentOS, RHEL, and Fedora.

### Dependencies
The following tools are commonly preinstalled:
- `bash`
- `top`
- `ps`
- `free`
- `df`
- `grep`, `awk`, `cut`, `bc`
- `journalctl` *(optional — for SSH failed login logs)*

To ensure all tools are available, you can install them using:
```bash
sudo apt install procps coreutils bc util-linux systemd -y
