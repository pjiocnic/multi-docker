cd  client
docker build -f Dockerfile.dev .

cd  worker
docker build -f Dockerfile.dev .

cd  server
docker build -f Dockerfile.dev .

docker-compose down  && docker-compose up --build

cmd d multiple times selection
opt+shift+right arrow
