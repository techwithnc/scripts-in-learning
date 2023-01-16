# How to install Node.js

sudo apt install -y nodejs

mkdir project01
cd project01
vim hello-world.js

[
const http = require('http');

const hostname = '0.0.0.0';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World! , By Tech With NC');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
]

node hello-world.js
