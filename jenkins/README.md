helm repo add jenkins https://charts.jenkins.io
helm repo update
helm install jenkins jenkins/jenkins
kubectl exec --namespace default -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo
