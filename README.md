# spring4shell-massive-scan

This project is a bash script that aims to scan a list of URLs to identify if they are vulnerable to Spring4Shell (CVE-2022-22965). It is not possible to say if this scanner is 100% reliable, but it is a good starting point. It is worth noting that the vulnerability occurs in specific paths, so it is recommended to perform a reconnaissance of existing paths before running this tool.

Scans for the CVE-2022-22965 vulnerability using GET and POSTS requests, original code from matheuscezar and changes by brinhosa. 

Uses requests like class.module.classLoader.URLs%5B0%5D=0 and class.module.classLoader.DefaultAssertionStatus=nonsense to verify if the vulnerability is present.

Usage:

```
chmod +x scan.sh
./scan.sh wordlist.txt
```

