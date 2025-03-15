#!/bin/bash

# Clear the terminal screen
clear

# Display the header with ASCII art and fancy formatting
echo -e "\e[1;35m"
echo " ██░ ██  ▄▄▄      ▓█████▄ ▓█████   ██████ "
echo "▓██░ ██▒▒████▄    ▒██▀ ██▌▓█   ▀ ▒██    ▒ "
echo "▒██▀▀██░▒██  ▀█▄  ░██   █▌▒███   ░ ▓██▄   "
echo "░▓█ ░██ ░██▄▄▄▄██ ░▓█▄   ▌▒▓█  ▄   ▒   ██▒"
echo "░▓█▒░██▓ ▓█   ▓██▒░▒████▓ ░▒████▒▒██████▒▒"
echo " ▒ ░░▒░▒ ▒▒   ▓▒█░ ▒▒▓  ▒ ░░ ▒░ ░▒ ▒▓▒ ▒ ░"
echo " ▒ ░▒░ ░  ▒   ▒▒ ░ ░ ▒  ▒  ░ ░  ░░ ░▒  ░ ░"
echo " ░  ░░ ░  ░   ▒    ░ ░  ░    ░   ░  ░  ░  "
echo " ░  ░  ░      ░  ░   ░       ░  ░      ░  "
echo "                   ░ Subdomain Discovery by Hades                      "
echo -e "\e[0m"

# Display a starting message
echo -e "\e[1;33mInitiating Subdomain Discovery... Uncovering Hidden Subdomains...\e[0m"

# Prompt for the domain and wordlist
echo -n "Enter the domain or target for subdomain enumeration: "
read file

# Check if domain is provided
if [ -z "$file" ]; then
    echo -e "\e[1;31mNo domain provided! Exiting...\e[0m"
    exit 1
fi

echo -n "Enter the path for the subdomain wordlist file: "
read wordlist

# Check if wordlist exists
if [ ! -f "$wordlist" ]; then
    echo -e "\e[1;31mWordlist not found! Exiting...\e[0m"
    exit 1
fi

# Function to check if a tool is installed
check_install() {
    tool=$1
    if ! command -v $tool &> /dev/null; then
        echo -e "\e[1;31m$tool is not installed. Installing now...\e[0m"
        return 1
    else
        echo -e "\e[1;32m$tool is already installed.\e[0m"
        return 0
    fi
}

# Install tools if not installed
check_install "subfinder" || { go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest && mv subfinder /usr/local/bin; }
check_install "assetfinder" || { go install github.com/tomnomnom/assetfinder@latest && mv assetfinder /usr/local/bin; }
check_install "amass" || { go install github.com/owasp-amass/amass/v4/...@master && mv amass /usr/local/bin; }
check_install "sublist3r" || { git clone https://github.com/aboul3la/Sublist3r.git && cd Sublist3r && pip3 install; }
check_install "gobuster" || { go install github.com/OJ/gobuster/v3@latest && mv gobuster /usr/local/bin; }
check_install "anew" ||  { go install -v github.com/tomnomnom/anew@latest && mv anew /usr/local/bin;  }
# Begin subdomain discovery process
echo -e "\e[1;36mRunning Discovery Tools for $file...\e[0m"

# Start running the discovery tools
subfinder -d $file -all -o subfinder.txt
assetfinder -subs-only $file | anew assetfinder.txt
sublist3r -d $file -v -o sublister.txt
curl -s "https://crt.sh/?q=$file" | grep -oP "(?<=<TD>)[a-zA-Z0-9.-]+\\.$file(?=</TD>)" | sort -u | anew crt.txt
amass enum -d $file -brute $wordlist | anew amass.txt
gobuster dns -d $file -w $wordlist -q -t 30 --wildcard | awk '{print $2}' > gobuster.txt


# Final message
echo -e "\e[1;32mSubdomain Discovery Completed!\e[0m"
echo -e "\e[1;33mResults have been saved in the following files:\e[0m"
echo -e "\e[1;32msubfinder.txt, assetfinder.txt, sublister.txt, crt.txt, amass.txt, gobuster.txt\e[0m"
echo "========================================================================="
