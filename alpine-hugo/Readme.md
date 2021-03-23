# Build Hugo
docker build --no-cache -t alpine-hugo:latest .

# Run Hugo
docker rm hugo-blog -f
#docker run -t -i  -d  --net=host --name=hugo-blog alpine-hugo:latest
docker run -t -i  -d  -p 80:1313 --name=hugo-blog alpine-hugo:latest
