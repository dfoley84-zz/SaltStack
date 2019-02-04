{%- if grains['os_family'] == 'Windows' %}
create_dir:
  file.directory:
    - name: C:\logrhythm

LRS_File:
  file.managed:
    - name: c:/logrhythm/LRSystemMonitor_64_7.4.2.8003.exe
    - source: salt://logrhythm/LRSystemMonitor_64_7.4.2.8003.exe

LRS_Install:
  cmd.run:
    - name: LRSystemMonitor_64_7.4.2.8003.exe /s /v" /qn ADDLOCAL=System_Monitor,RT_FIM_Driver HOST= SERVERPORT=443 CLIENTADDRESS={{ grains['fqdn_ip4'][0] }} ClientPort=0
    - cwd: C:\logrhythm

/srv/salt/logrhythm/proxy-1.ini:
  file.managed:
    - source: salt://logrhythm/proxy-1.ini
    - name: C:\Program Files\LogRhythm\LogRhythm System Monitor\config\proxy.ini
    - template: jinja

/srv/salt/logrhythm/scsm.ini:
  file.managed:
    - source: salt://logrhythm/scsm-recommind_dev_virginia.ini
    - name: C:\Program Files\LogRhythm\LogRhythm System Monitor\config\scsm.ini
    - template: jinja

AutoStart Service:
  module.run:
    - win_service.config:
      - service: scsm
      - start_type: auto

{% endif %}

{%- if grains['os_family'] == 'Ubuntu' %}
Ubuntu_rsyslog:
  file.managed:
    - source: salt://logrhythm/rsyslog.conf
    - name: /etc/rsyslog.conf

service.restart rsyslog:
  module.wait:
    - name: service.restart
    - m_name: rsyslog
    - watch:
      - file: /etc/rsyslog.conf
{% endif %}
