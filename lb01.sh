upstream lb01 {
    server localhost:3000;
    server localhost:3001;
}
server {
    listen 80;
    server_name lb.techwithnc.com_;
    location /mypath {
        proxy_pass http://lb01; //point to upstream
    }
}