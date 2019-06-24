copy_VAP_files:
  file.recurse:
    - source: salt://software/OCS_Installer/
    - name: C:\ProgramData\OCS
    - makedirs: True

{%- if 'vapshared' in grains['role'] %}
{% if grains['kernel'] == 'Windows' %}

install_ocsagent:
  cmd.run:
    - name: '{{ pillar['VAP_OCS'] }}'
    - cwd: C:\ProgramData\OCS
    - unless: 'sc query "OCS Inventory Service"'

  {% endif %}
{% endif %}

{%- if 'dbpshared' in grains['role'] %}
{% if grains['kernel'] == 'Windows' %}
install_ocsagent:
  cmd.run:
    - name: {{ pillar['DBP_OCS'] }}
    - cwd: C:\ProgramData\OCS
    - unless: 'sc query "OCS Inventory Service"'

{% endif %}
{% endif %}

{%- if 'lopshared' in grains['role'] %}
{% if grains['kernel'] == 'Windows' %}
install_VAP_ocsagent:
  cmd.run:
    - name: {{ pillar['LOP_OCS'] }}
    - cwd: C:\ProgramData\OCS
    - unless: 'sc query "OCS Inventory Service"'
          
{% endif %}
{% endif %}

{%- if 'mopshared' in grains['role'] %}
{% if grains['kernel'] == 'Windows' %}
install_ocsagent:
  cmd.run:
    - name: {{ pillar['MOP_OCS'] }}
    - cwd: C:\ProgramData\OCS
    - unless: 'sc query "OCS Inventory Service"'
    
{% endif %}
{% endif %}
