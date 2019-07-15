docker build -t ladis29/multi-client:latest -t ladis29/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t ladis29/multi-server:latest -t ladis29/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t ladis29/multi-worker:latest -t ladis29/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push ladis29/multi-client:latest
docker push ladis29/multi-server:latest
docker push ladis29/multi-worker:latest

docker push ladis29/multi-client:$SHA
docker push ladis29/multi-server:$SHA
docker push ladis29/multi-worker:$SHA

kubectl apply -f k8s
kubectl ser image deployments/server-deployment server=ladis29/multi-server:$SHA
kubectl ser image deployments/client-deployment client=ladis29/multi-client:$SHA
kubectl ser image deployments/worker-deployment worker=ladis29/multi-worker:$SHA