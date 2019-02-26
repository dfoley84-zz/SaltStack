create_dir:
  file.directory:
    - name: C:\logrhythm

LRS_File:
  file.managed:
    - name: c:/logrhythm/LRSystemMonitor_64_7.4.2.8003.exe
    - source: salt://logrhythm/LRSystemMonitor_64_7.4.2.8003.exe


proxyCopyi:
  file.managed:
    - source: salt://logrhythm/proxy-recommind_dev_virginia-1.ini
    - name: c:\logrhythm\proxy.ini
    - template: jinja



LRS_Install:
  cmd.run:
    - name: LRSystemMonitor_64_7.4.2.8003.exe /s /v" /qn ADDLOCAL=System_Monitor,RT_FIM_Driver HOST=10.58.18.100 SERVERPORT=443 CLIENTADDRESS={{ grains['fqdn_ip4'][0] }} CLIENTPORT=0"
    - cwd: C:\logrhythm
    
LogRythm:
  full_name: 'logrhythm'
  installer: C:\logrhythm\LRSystemMonitor_64_7.4.2.8003.exe
  install_flags: /s /v" /qn ADDLOCAL=System_Monitor,RT_FIM_Driver HOST=10.58.18.100 SERVERPORT=443 CLIENTADDRESS={{ grains['fqdn_ip4'][0] }} CLIENTPORT=0"
  uninstaller: C:\logrhythm\LRSystemMonitor_64_7.4.2.8003.exe
  uinstall_flags: /qn /norestart
  msiexec: False
  locale: en-us
  reboot: False 


/srv/salt/logrhythm/proxy-recommind_dev_virginia-1.ini:
  file.managed:
    - source: salt://logrhythm/proxy-recommind_dev_virginia-1.ini
    - name: C:\Program Files\LogRhythm\LogRhythm System Monitor\config\proxy.ini
    - template: jinja

/srv/salt/logrhythm/scsm-recommind_dev_virginia.ini:
  file.managed:
    - source: salt://logrhythm/scsm-recommind_dev_virginia.ini
    - name: C:\Program Files\LogRhythm\LogRhythm System Monitor\config\scsm.ini

Start Service:
  cmd.run:
    - name: 'net start scsm'