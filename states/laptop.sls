set timezone:
  timezone.system:
    - name: Europe/London
vscodeRepo:
  pkgrepo.managed:
    - humanname: VSCodeRepo
    - baseurl: https://packages.microsoft.com/yumrepos/vscode
    - gpgcheck: 0
dockerRepo:
  pkgrepo.managed:
    - humanname: DockerRepo
    - baseurl: https://download.docker.com/linux/fedora/$releasever/$basearch/stable/
    - gpgcheck: 0
teamsRepo:
  pkgrepo.managed:
    - humanname: TeamsRepo
    - baseurl: https://packages.microsoft.com/yumrepos/ms-teams/
    - gpgcheck: 0
install packages:
  pkg.installed:
    - pkgs:
      - code
      - chromium
      - docker-compose
      - golang
      - kubernetes-client
      - moby-engine
      - teams
      - wget
start docker:
  service.running:
    - name: docker
    - enable: true
download terraform:
  cmd.run:
    - name: wget https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_linux_amd64.zip
extract terraform:
  cmd.run:
    - name: unzip terraform_0.14.3_linux_amd64.zip && mv -f terraform /usr/bin 
tidy up:
  cmd.run:
    - name: rm terraform_*.* -f