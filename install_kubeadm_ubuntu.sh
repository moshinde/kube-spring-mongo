sudo apt-get update
apt-get install -y apt-transport-https
sudo su -
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
> deb http://apt.kubernetes.io/ kubernetes-xenial main
> EOF

apt-get update
apt-get install -y docker.io
apt-get install -y kubelet kubeadm kubectl kubernetes-cni

kubeadm init
exit
kubectl get node
sudo su -
export kubever=$(kubectl version| base64| tr -d '\n')
sysctl net.bridge.bridge-nf-call-iptables=1
kubectl apply -f https://cloud.weave.works/k8s/net?k8s-version=$kubever