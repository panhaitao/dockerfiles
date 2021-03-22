# BUILD

`docker build -t alpine-ansible:latest .`

# RUN

`docker run --net=host -t -i -e 'ROOT_PW=xxxxxxx' -d alpine-ansible:latest`

# ENV

ROOT_PW  default is admin

# Content

- git sshd jmeter nginx
- ansible and some playbooks
