zabbix:
  group:
    - present
  user:
    - present
    - home: /home/zabbix
    - shell: /bin/bash
    - password: '$6$8stAtY6O$9o8prUuAeg94heacqhN2SsOTWQ/Kz7YzZOuByAKSQ9yREYn35Xax1xSXs0iBWFKZSRt3tO6o.bZSWkIun65Qe0'
    - groups:
      - zabbix
    - require:
      - group: zabbix
