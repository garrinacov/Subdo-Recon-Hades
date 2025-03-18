# Subdomain Discovery by Hades

![image](https://github.com/user-attachments/assets/13695905-36cf-4f20-89e6-571d2b05b1e3)

---

# Description
`Subdomain Discovery by Hades` is an automated script designed to uncover hidden subdomains of a given domain using various popular and effective subdomain enumeration tools. This script integrates several tools, including Subfinder, Assetfinder, Findomain, Sublist3r, DNSX, and HTTPX, to perform comprehensive and in-depth subdomain discovery on the provided target. These tools use different methods to identify subdomains more effectively, including those that might be missed by other techniques. All results are saved into separate output files for further security analysis or exploitation.

# Key Features
- `Subfinder`:  
  > Provides comprehensive subdomain results with support for searching through various data sources.

- `Assetfinder`:  
  > Discovers subdomains by searching related assets to the target.

- `Findomain`:  
  > Performs subdomain enumeration with brute force capabilities using default methods without the need for an external wordlist.

- `Sublist3r`:  
  > A fast tool to discover subdomains using multiple open-source data sources.

- `DNSX`:  
  > A fast and multi-purpose DNS toolkit designed for running various probes through the retryabledns library. It supports multiple DNS queries, user-supplied resolvers, and DNS wildcard filtering (like shuffledns).

- `HTTPX`:  
  > A fast and multi-purpose HTTP toolkit that allows running multiple probes using the retryablehttp library. It is designed to maintain result reliability with an increased number of threads.

# Requirements
- Go programming language  
- Python 3  
- Internet access to download required tools  

# Installation
Ensure you have Go and Python 3 installed. Run the script to automatically install the necessary tools.

The script will also install the following tools if not already present:
- Subfinder
- Assetfinder
- Findomain
- Sublist3r
- DNSX
- HTTPX

Ensure your system has internet access to download the required tools.

# Usage
1. Download or clone this repository.
2. Run the script `./subdomain_discovery.sh` in the terminal.
3. Enter the domain you want to analyze.
4. The script will automatically run the discovery tools and save the results in several files.

# Output
The results from the subdomain discovery will be saved in the following files:
- `live-domain.txt`
