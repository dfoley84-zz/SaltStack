njs-user:
  user.present:
    - home:  njs
    - home: /home/njs

git-client-pacakge:
  pkg.installed:
    - name: git

njs-source:
  git.latest:
    - name: https://github.com/
git
    - rev: master
    - target: /home/ndjs/site

npm-install:
  cmd.wait:
    - name: npm install
    - cwd: /home/njs/site
    - watch:
      - git: ndjs-source

build-script:
  cmd.wait:
    - name: npm run-script build
    - cwd: /home/ndjs/site
    - watch:
      - git: ndjs-source
