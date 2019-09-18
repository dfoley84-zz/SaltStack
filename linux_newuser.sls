david:
  user.present:
    - home: /home/david
    - shell: /bin/bash
    - fullname: David
    - groups:
{% if grains['os'] == 'Ubuntu' %}          
      - docker
      - sudo
{% elif grains['os'] == 'RedHat' %}
      - wheel 
      - docker 
{% endif %}}
      
        
