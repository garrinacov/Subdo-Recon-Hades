# Subdo-Recon-Hades

![image](https://github.com/user-attachments/assets/13695905-36cf-4f20-89e6-571d2b05b1e3)

![image](https://github.com/user-attachments/assets/ae4214c2-f2de-4aa9-827d-cd3e0fc09576)

---

# Description
Subdomain Discovery by Hades is an automated script designed to help uncover hidden subdomains from a given domain using various popular and effective subdomain enumeration tools. This script integrates several tools such as Subfinder, Assetfinder, Amass, Sublist3r, and Gobuster to perform comprehensive and in-depth subdomain discovery on the provided target. These tools work in different ways, allowing users to identify subdomains more effectively, including those that might be missed by other methods. All results are saved into different output files that can be used for further security analysis or exploitation.

# Key Features
- Subfinder: Provides comprehensive subdomain results with support for searching through various data sources.  
- Assetfinder: Discovers subdomains by searching related assets to the target.  
- Amass: Performs subdomain enumeration with brute force capabilities using a specified wordlist.  
- Sublist3r: A fast tool to discover subdomains using multiple open-source data sources.  
- Gobuster: Uses DNS brute forcing to discover subdomains with high speed.  

# Requirements
- Go programming language  
- Python 3  
- Internet access to download required tools and wordlist files  

# Installation
Ensure you have Go and Python 3 installed. Run the script to automatically install the necessary tools. Ensure you have a wordlist file for Amass and Gobuster to use in the brute-forcing process.  

# Usage
Download or clone this repository.  
Run the script subdomain_discovery.sh in the terminal.  
Enter the domain you want to analyze and select the wordlist file for brute-force searching.  
The script will automatically run the discovery tools and save the results in several files.  

# Output
- subfinder.txt  
- assetfinder.txt  
- sublister.txt  
- crt.txt  
- amass.txt  
- gobuster.txt  
