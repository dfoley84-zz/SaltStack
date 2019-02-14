<<<<<<< HEAD
nginx:
  pkg.installed: []
  service.running:
    watch:
      file: /etc/nginx.conf

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://load-balance/nginx.conf
=======
nginx:
  pkg.installed: []
  service.running:
    watch:
      file: /etc/nginx.conf

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://load-balance/nginx.conf
>>>>>>> 199b9bb2a68ef8300ea783cd497951e2c7cf8fc9
