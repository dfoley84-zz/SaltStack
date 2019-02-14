<<<<<<< HEAD
include:
  - site

supervisor:
  pkg.installed:
    - require:
      - sls: site
  service.running:
    - watch:
      - file: /etc/supervisor/conf.d/site.conf:

/etc/supervisor/conf.d/site.conf:
  file.managed:
    - source: salt://service/supervisor.conf
    - require:
      - pkg: supervisor
      
=======
include:
  - site

supervisor:
  pkg.installed:
    - require:
      - sls: site
  service.running:
    - watch:
      - file: /etc/supervisor/conf.d/site.conf:

/etc/supervisor/conf.d/site.conf:
  file.managed:
    - source: salt://service/supervisor.conf
    - require:
      - pkg: supervisor
      
>>>>>>> 199b9bb2a68ef8300ea783cd497951e2c7cf8fc9
