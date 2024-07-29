
.EXPORT_ALL_VARIABLES:
# https://github.com/k3d-io/k3d/pull/1268
K3D_FIX_MOUNTS=1
# https://github.com/k3d-io/k3d/issues/209
# K3D_FIX_DNS=1


.PHONY: create-k3d
create-k3d:
	#./create_cluster.sh
	k3d cluster create -c k3d-cluster.yaml

.PHONY: delete-k3d
delete-k3d:
	k3d cluster delete mycluster

.PHONY: helm-setup
helm-setup:
	helm repo add flink-operator https://downloads.apache.org/flink/flink-kubernetes-operator-1.9.0/
	helm repo add jetstack https://charts.jetstack.io
	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx	
	helm repo update

cert-manager-install:
	helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set installCRDs=true
	kubectl apply -f cluster-cert-issuer.yml

nginx-install:
	kubectl create namespace nginx
	helm install ingress-nginx ingress-nginx/ingress-nginx -f nginx-values.yml --namespace nginx


.PHONY: flink-operator-install
flink-operator-install:
	helm install flink-kubernetes-operator flink-operator/flink-kubernetes-operator --namespace flink --create-namespace

.PHONY: create-flink-cluster
create-flink-cluster:
	kubectl kustomize --enable-helm ./flink | kubectl apply -f - 