#!/bin/bash
# =======================================================
# 🌐 Website Uptime Checker (Windows-Safe, Final-Final)
# Author: Your Name
# =======================================================

# -------------------------------------------------------
# 1. Input and Output Files
# -------------------------------------------------------
URL_FILE="${1:-websites.txt}"   # Default: websites.txt unless user provides another file
LOG_FILE="uptime_log.txt"

# -------------------------------------------------------
# 2. Validate URL File
# -------------------------------------------------------
if [ ! -f "$URL_FILE" ]; then
    echo "❌ Error: $URL_FILE not found."
    echo "Usage: ./uptime_checker.sh [url_file]"
    exit 1
fi

# -------------------------------------------------------
# 3. Startup Message
# -------------------------------------------------------
echo "🌐 Starting Website Uptime Check..."
echo "Reading from: $URL_FILE"
echo "Results will be saved to: $LOG_FILE"
echo "========================================="

# -------------------------------------------------------
# 4. Main Loop: Read URLs Safely
# -------------------------------------------------------
while IFS= read -r url || [ -n "$url" ]; do
    # --- Step 4a: Clean CRLF (^M) and trim ---
    url=$(echo "$url" | sed 's/\r//g' | xargs)

    # --- Step 4b: Skip empty lines and comments ---
    [[ -z "$url" || "$url" == \#* ]] && continue

    # --- Step 4c: Check Website ---
    if curl -ILs --max-time 5 --connect-timeout 3 "$url" > /dev/null 2>&1; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') ✅ $url is UP" | tee -a "$LOG_FILE"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') ❌ $url is DOWN" | tee -a "$LOG_FILE"
    fi

done < "$URL_FILE"

# -------------------------------------------------------
# 5. End Message
# -------------------------------------------------------
echo "========================================="
echo "✅ Uptime check complete. Log saved to: $LOG_FILE"
