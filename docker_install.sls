{% if grains.os_family == 'RedHat' %}
{% set update = 'apt' %}
{% set keys = 'yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo' %}
{% set config = 'yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.33-1.git86f33cd.el7.noarch.rpm' %}
{% elif grains.os_family == 'Debian' %}
{% set update = 'yum' %}
{% set keys = 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –' %}
{% set config = 'add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"'%}
{% endif %}

  Docker_key:
    cmd.run:
      - name: {{ keys }}

  Docker_Repo:
    cmd.run:
      - name: {{ config }}

  Update_Linux:
    cmd.run: 
      - name: {{ update }} update && upgrade -y 
  
  Install_Docker:
    pkg.installed:
      - name: docker-ce
  service.running:
    - name: docker
    - require:
      - pkg: docker-ce
    