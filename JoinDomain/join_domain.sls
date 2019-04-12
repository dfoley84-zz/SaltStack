Install_Packages:
  pkg.latest:
    - pkgs:
    {% if grains['os'] == 'Ubuntu' %}
      - sssd
      - realmd
      - krb5-user
      - samba-common
      - packagekit
      - adcli
    {% elif grains['os'] == 'RedHat' %}
      - sssd
      - realmd
      - krb5-workstation
      - samba-common-tools
   {% endif %}

Hostname:
  cmd.run:
    - name: 'hostnamectl set-hostname HOSTNAME'

Join_Domain:
  cmd.run:
    - name: 'echo "{{ pillar['Domain_Administrator_Password'] }}" | realm join -U {{ pillar['Domain_Administrator'] }}@{{ pillar['RMDOMAIN_CAPS'] }} {{ pillar['RMDOMAIN'] }} --verbose'

Enable_Password:
  cmd.run:
    - name: 'sed -i "s/^PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config'

realm_permit:
  cmd.run:
    - name: 'realm permit --groups sysops@{{ pillar['RMDOMAIN_CAPS'] }}'

Sudoers:
  cmd.run:
    - name: 'echo "%sysops@{{ pillar['RMDOMAIN_CAPS'] }} ALL=(ALL:ALL) ALL" >> /etc/sudeors'

reboot_minions:
  cmd.run:
    - name: 'shutdown -r 1'
