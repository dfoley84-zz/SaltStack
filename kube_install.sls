{% if grains.os_family == 'RedHat' %}
{% set update = 'yum' %}
{% set keys = 'yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo' %}
{% set config = 'yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.33-1.git86f33cd.el7.noarch.rpm' %}
{% set kube_key = '' %}
{% set kube_repo = ''  %}

{% elif grains.os_family == 'Debian' %}
{% set update = 'apt' %}
{% set keys = 'curl -K -fsSL https://download.docker.com/linux/ubuntu/gpg >> text.txt | sudo apt-key add text.txt' %}
{% set config = 'add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"' %}
{% set kube_key = 'curl -K -s https://packages.cloud.google.com/apt/doc/apt-key.gpg >> kube.txt | sudo apt-key add kube.txt' %}
{% set kube_repo = 'sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"'  %}
{% endif %}

Docker_key:
  cmd.run:
    - name: {{ keys }}
Docker_Repo:
  cmd.run:
    - name: {{ config }}
Update_Linux:
  cmd.run:
    - name: {{ update }} update

Install_Docker:
  pkg.installed:
    - name: docker-ce

Docker_Run:
  service.running:
    - name: docker
    - require:
        - pkg: docker-ce

Kubernetes_key:
  cmd.run:
    - name: {{ kube_key }}
Kubernetes_Repo:
  cmd.run:
    - name: {{ kube_repo }}

Kubernetes_install:
  pkg.installed:
    - name: kubelet
    - name: kubeadm
    - name: kubectl

Kubernetes_Run:
  service.running:
    - name: kubeadm
    - name: kubectl
    - name: kubelet
