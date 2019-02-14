create_dir:
  file.directory:
    - name: C:\sentinel

copy_files1:
  file.recurse:
    - source: salt://sentinel/
    - name: C:\sentinel\
    - makedirs: True

#uninstall Endpoint Proctection
uninstall:
  cmd.script:
    - source: c:/s1/endpoint.ps1
    - shell: powershell
    - env:
      - ExecutionPolicy: "bypass"

LRS_Install:
  cmd.run:
    - name: SentinelOne-windows-Denali_windows_v2_7_4_6510.exe /SITE_TOKEN=<> /SERVER_PROXY=https://<>:3128 /Q /FORCERESTART
    - cwd: C:\sentinel
