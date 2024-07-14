setup:
	echo Install 'kubectl'
	echo Install 'Helm'

kill-all:
	helm uninstall jenkins
	helm uninstall prometheus
	helm uninstall sonarqube

argo-setup:
	helm repo add argo-cd https://argoproj.github.io/argo-helm
	helm dep update argo-cd/

argo-start:
	# kubectl create namespace argo-cd
	helm install argo-cd argo-cd/

argo-access:
	kubectl port-forward service/argo-cd-argocd-server -n default --address=0.0.0.0 8080:80

argo-kill:
	helm uninstall argo-cd

jenkins-setup:
	helm repo add jenkins https://charts.jenkins.io
	helm dep update jenkins/

jenkins-start:
	helm install jenkins jenkins/

jenkins-access:
	kubectl port-forward service/jenkins -n default --address=0.0.0.0 8081:8080

jenkins-kill:
	helm uninstall jenkins
