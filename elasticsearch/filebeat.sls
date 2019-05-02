{% if grains['os'] == 'RedHat' %}

Download_Filebeat:
  cmd.run:
    - name: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.0.1-x86_64.rpm
    - creates: /home/filebeat-7.0.1-x86_64.rpm

Unpackage:
  cmd.run:
    - name: dpkg -i filebeat-7.0.1-amd64.deb
    - cwd: /home

{% elif grains['os'] == 'Ubuntu' %}
Download_Filebeat:
  cmd.run:
    - name: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.0.1-amd64.deb
    - creates: /home/filebeat-7.0.1-amd64.deb

Unpackage:
  cmd.run:
    - name: dpkg -i filebeat-7.0.1-amd64.deb
    - cwd: /home

{% endif %}

filebeat_file:
  file.managed:
    - source: salt://Elk/filebeat.yml
    - name: /etc/filebeat/filebeat.yml
    - template: jinja

Enable_filebeat:
  cmd.run:
    - name: filebeat modules enable system
    - cwd: /etc/filebeat

Setup:
  cmd.run:
    - name: filebeat setup

Start_Service:
  cmd.run:
    - name: service filebeat start
