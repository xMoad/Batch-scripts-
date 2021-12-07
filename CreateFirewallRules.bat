Netsh.exe advfirewall firewall delete rule "CCHiL Rule 1"

Netsh.exe advfirewall firewall add rule ^
	name="CCHiL Rule 1" ^
	action=Allow ^
	dir=in ^
	localip=192.168.40.0-192.168.40.255 ^
	remoteip=any ^
	protocol=any ^
  
 
Netsh.exe advfirewall firewall delete rule "CCHiL Rule 2"

Netsh.exe advfirewall firewall add rule ^
	name="CCHiL Rule 2" ^
	dir=in ^
	action=allow ^
	protocol=udp ^
	localip=any ^
	remoteip=any ^
	localport=11116 ^
	remoteport=11115 ^
   








