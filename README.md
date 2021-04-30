# This is a docker for EC2 testing purpose
- Tested with Ubuntu 20 on AWS EC2
- Built-in with tmux, nano, node and express
- Before run the node, prepare the Ubuntu first
- It doesn't contain `App.js` so you have to `ssh` and `nano` it
- docker port 80:3000
- Make sure that you setup VPC, Public Subnet (with Internet Gateway), Security group (SSH)

```
AWS Security Inbound group:
// For ping purpose to ensuer that EC2 is reachable
Custom ICMP - IPv4, Echo Request
```

# Prepare Ubuntu
```
// # Setup new ubuntu

// ## Init all basic stuff
sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get install build-essential
sudo apt-get install nano

// ## Docker SETUP
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt install docker-ce docker-ce-cli containerd.io

// sudo systemctl status docker

// $USER is an environment variable that holds your username.
// Log out and log back in so that the group membership is refreshed
sudo usermod -aG docker $USER

// Change the access permission of the docker.sock file
chmod 777 /var/run/docker.sock
docker run hello-world

// ## Docker Compose Steup
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

# app.js
```
'use strict';

const express = require('express');

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
```