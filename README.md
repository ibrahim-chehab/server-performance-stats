# Server Stats Script

## Overview

`server-stats.sh` is a lightweight and portable Bash script designed to analyze and display basic server performance statistics. It provides information about CPU, memory, disk usage, top processes, and more. Ideal for Linux servers, it can be run on any system with Bash support.

---

## Features

- **CPU Usage**: Displays the total CPU usage.
- **Memory Usage**: Shows free and used memory with percentages.
- **Disk Usage**: Reports total, free, and used disk space with percentages.
- **Top Processes**:
  - By CPU usage.
  - By memory usage.
- **Stretch Goals** (Optional):
  - OS version.
  - Uptime.
  - Load average.
  - Number of logged-in users.
  - Failed login attempts.

---

## Requirements

- Linux operating system or a Bash environment (e.g., WSL, Git Bash, or Cygwin for Windows).
- Basic Bash utilities like `top`, `awk`, `df`, `free`, and `grep`.

---

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/server-stats.git
   cd server-stats
