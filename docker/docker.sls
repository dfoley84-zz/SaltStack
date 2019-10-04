{% if grains.os_family == 'RedHat' %}
{% set update = 'yum' %}
{% set keys = salt['pillar.get']('Docker:Keys:RedHat') %}
{% set config = salt['pillar.get']('Docker:Repo:RedHat') %}
{% set Docker_Version = salt['pillar.get']('Docker:Version:RedHat')}} %}
{% elif grains.os_family == 'Debian' %}
{% set update = 'apt' %}
{% set keys = salt['pillar.get']('Docker:Keys:Ubuntu') %}
{% set config = salt['pillar.get']('Docker:Repo:Ubuntu') %}
{% set Docker_Version = salt['pillar.get']('Docker:Version:Ubuntu')}} %}
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
    - version: {{ Docker_Version }}
    
Docker_Run:
  service.running:
    - name: docker
    - require:
        - pkg: docker-ce

