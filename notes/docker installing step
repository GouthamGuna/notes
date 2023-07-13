This quick video will show you the commands you need to run to install docker-ce on ubuntu 22.04 using APT, which will also allow it to stay updated with regular updates.

Enjoy the video, and LIKE and SUBSCRIBE: https://ytube.io/3aGp

Steps to install:
+ sudo apt-get update
+ sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release software-properties-common
+ sudo mkdir -p /etc/apt/keyrings
+ curl -fsSL https://download.docker.com/linux/ubu... | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
+ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
+ sudo apt-get update
+ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
- Edit the /etc/groups file (use sudo), and add your username at the end of the line with docker (after the colon)
- Log out and log back in
+ docker info
+ docker run hello-world
