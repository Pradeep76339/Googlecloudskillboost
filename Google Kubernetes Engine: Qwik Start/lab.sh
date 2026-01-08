gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-b
gcloud container clusters create --machine-type=e2-medium --zone=us-central1-b lab-cluster
gcloud container clusters get-credentials lab-cluster
kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0
kubectl expose deployment hello-server --type=LoadBalancer --port 8080
kubectl get service

#get EXTERNAL-IP and paste
http://[EXTERNAL-IP]:8080
gcloud container clusters delete lab-cluster

#Y to confirm
