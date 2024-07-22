setup:
	echo Install 'kubectl'
	echo Install 'Helm'

# kill-all:
# 	helm uninstall jenkins
# 	helm uninstall prometheus
# 	helm uninstall sonarqube

argo-setup:
	helm repo add argo-cd https://argoproj.github.io/argo-helm
	helm dep update cd/argo-cd/

argo-start:
	# kubectl create namespace argo-cd
	helm install argo-cd cd/argo-cd/

argo-access:
	kubectl port-forward service/argo-cd-argocd-server -n default --address=0.0.0.0 8080:80

argo-kill:
	helm uninstall argo-cd

jenkins-setup:
	helm repo add jenkins https://charts.jenkins.io
	helm dep update cd/jenkins/

jenkins-start:
	helm install jenkins cd/jenkins/

jenkins-access:
	kubectl port-forward service/jenkinsapp -n default --address=0.0.0.0 8081:8080

jenkins-kill:
	helm uninstall jenkins

prometheus-setup:
	helm repo add prometheus https://prometheus-community.github.io/helm-charts
	helm dep update cd/prometheus/

prometheus-start:
	helm install prometheus cd/prometheus/

prometheus-access:
	kubectl port-forward service/prometheusapp-server -n default --address=0.0.0.0 8082:80

prometheus-kill:
	helm uninstall prometheus

grafana-setup:
	helm repo add grafana https://artifacthub.io/packages/helm/grafana/grafana
	helm dep update cd/grafana/

grafana-start:
	helm install grafana cd/grafana/

grafana-access:
	kubectl port-forward service/grafanaapp -n default --address=0.0.0.0 8083:80

grafana-kill:
	helm uninstall grafana

todomvc-start:
	helm install todomvc cd/todomvc/

todomvc-access:
	kubectl port-forward service/todo-mvc-srv -n default --address=0.0.0.0 8084:80

todomvc-kill:
	helm uninstall todomvc
