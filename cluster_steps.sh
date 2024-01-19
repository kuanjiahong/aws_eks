# cluster creation v1.27
eksctl create cluster --name my-cluster --region us-east-2 --version=1.27

# update kubeconfig
aws eks update-kubeconfig --region us-east-2 --name my-cluster

# create namespace
kubectl create namespace azure-pipeline-agents

# create secret
kubectl create secret docker-registry regcred \
  --docker-server=123456789012.dkr.ecr.us-east-2.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password) \
  --namespace=azure-pipeline-agents

# create deployment
kubectl apply -f ado_agent_deployment.yaml

# create kaniko pod
kubectl apply -f pod.yaml


# get logs
kubectl logs pod/kaniko -n azure-pipeline-agents

# delete pod
kubectl delete pod kaniko -n azure-pipeline-agents

# cluster deletion
eksctl delete cluster --name my-cluster --region us-east-2