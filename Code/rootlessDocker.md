RUN BEFORE INSTALLING DOCKER SHIT
curl -sSL https://get.docker.com/rootless | sh
apt install -y uidmap
^ run as unprivileged

or (idk if below works, just random command note taking)

sudo apt-get install -y docker-ce-rootless-extras
export PATH=/usr/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock
