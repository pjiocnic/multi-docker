docker build -t pjoisha/multi-client:latest -t pjoisha/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t pjoisha/multi-server:latest -t pjoisha/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t pjoisha/multi-worker:latest -t pjoisha/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push pjoisha/multi-client:latest
docker push pjoisha/multi-server:latest
docker push pjoisha/multi-worker:latest

docker push pjoisha/multi-client:$SHA
docker push pjoisha/multi-server:$SHA
docker push pjoisha/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=pjoisha/multi-server:$SHA
kubectl set image deployments/client-deployment client=pjoisha/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=pjoisha/multi-worker:$SHA