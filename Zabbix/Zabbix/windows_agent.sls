create_dir:
  file.directory:
    - name: C:\zabbix

zabbix_server_config:
  file.managed:
    - name: c:/zabbix/zabbix_agentd.conf
    - source: salt://zabbix/zabbix_agentd.conf

zabbix_server_config:
  file.managed:
    - name: c:/zabbix/zabbix_agentd.exe
    - source: salt://zabbix/zabbix_agentd.exe

install_zabbix_agent:
  cmd.run:
    - name: 'zabbix_agentd.exe --config C:\zabbix\zabbix_agentd.conf --install'
    - cwd: C:\zabbix\bin\win64
    - unless: 'sc query "Zabbix Agent"'

run_zabbix_agent:
  cmd.run:
    - name: 'zabbix_agentd.exe --start'
    - cwd: C:\zabbix\bin\win64\
