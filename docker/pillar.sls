Docker:
  Keys:
    Redhat: 'yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo'
    Ubuntu: 'curl -K -fsSL https://download.docker.com/linux/ubuntu/gpg >> text.txt | sudo apt-key add text.txt'
  Repo:
    Redhat: 'yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.33-1.git86f33cd.el7.noarch.rpm'
    Ubuntu: 'add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"'
  Version:
    Redhat: '17.09.ce-1.el7.centos'
    Ubuntu: '17.09.0~ce-0~ubuntu'


