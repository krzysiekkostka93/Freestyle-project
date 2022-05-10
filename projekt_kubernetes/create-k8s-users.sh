#!/usr/bin/env bash
MINIKUBE_DIR="$HOME/.minikube"
CERTS_DIR=minikube_users
print_usage() {
  printf "Usage: $(basename $0) CertSubject\nCertSubject format: /CN=<something>[/O=<something_else>]\n"
}

[[ $# -ne 1 ]] && print_usage && exit 1
[[ -f "$MINIKUBE_DIR/ca.crt" ]] && [[ -f "$MINIKUBE_DIR/ca.key" ]]
username=$(echo $1 | cut -d '/' -f2 | cut -d '=' -f 2)
echo $username
mkdir -p $CERTS_DIR && cd $CERTS_DIR
openssl genrsa -out $username.key 2048
openssl req -new -key $username.key -out $username.csr -subj $1
openssl x509 -req -in $username.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out $username.crt -days 500
kubectl config set-credentials $username --client-certificate=$username.crt --client-key=$username.key
kubectl config set-context $username-minikube-context --cluster=minikube --user=$username
kubectl config use-context $username-minikube-context
