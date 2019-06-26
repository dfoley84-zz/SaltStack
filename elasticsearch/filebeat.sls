{% if grains['os'] == 'RedHat' %}

Download_Filebeat:
  cmd.run:
    - name: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.2.0-x86_64.rpm
    - creates: /home/ec2-user/filebeat-7.2.0-x86_64.rpm

Unpackage:
  cmd.run:
    - name: dpkg -i filebeat-7.0.1-amd64.deb
    - cwd: /home/ec2-user/

{% elif grains['os'] == 'Ubuntu' %}
Download_Filebeat:
  cmd.run:
    - name: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.2.0-amd64.deb
    - creates: /home/ubuntu/filebeat-7.2.0-amd64.deb

Unpackage:
  cmd.run:
    - name: dpkg -i filebeat-7.2.0-amd64.deb
    - cwd: /home/ubuntu

{% endif %}

filebeat_file:
  file.managed:
    - source: salt://sent/filebeat.yml
    - name: /etc/filebeat/filebeat.yml

Enable_filebeat:
  cmd.run:
    - name: filebeat modules enable system
    - cwd: /etc/filebeat

enable_filebeat1:
  cmd.run:
    - name: filebeat modules enable iptables

Start_Service:
  cmd.run:
    - name: service filebeat start
