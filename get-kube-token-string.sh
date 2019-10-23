TOKEN="`sudo kubeadm token list | grep '^.*\.' | cut -d ' ' -f1`"
HASH="`openssl x509 -in /etc/kubernetes/pki/ca.crt -noout -pubkey | openssl rsa -pubin -outform DER 2>/dev/null | sha256sum | cut -d' ' -f1`"

echo "kubeadm join `hostname -I | awk '{print $1}'`:6443 --token $TOKEN --discovery-token-ca-cert-hash sha256:$HASH"
