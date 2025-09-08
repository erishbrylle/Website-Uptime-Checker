# 🌐 Website Uptime Checker

A simple Bash script that checks if websites are online and logs their status with timestamps.  
Useful for monitoring website availability or testing connectivity.

---

## 📌 Features
- Reads a list of websites from a text file (`websites.txt`).  
- Skips comments (`#`) and empty lines.  
- Uses `curl` to check if sites respond with **200 / 301 / 302**.  
- Logs results with timestamps to `uptime_log.txt`.  
- Works on Linux and macOS.  

---

## 🚀 Usage

### 1. Clone this repository
```bash
git clone https://github.com/yourusername/uptime-checker.git
cd uptime-checker
```
### 2. Create a websites.txt file
```bash
# List of websites to monitor
https://google.com
https://github.com
https://openai.com
https://somerandomnonexistingsite123.com
```
### 3. Run the script
