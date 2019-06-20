# BUILD

`docker build -t alipine-nginx:latest .`

# RUN

`docker run --net=host -t -i -d alipine-nginx -v /home/shenlan/workspaces/SoldierSuit/:/var/www/localhost/htdocs/`
