#!/bin/sh

set -ouex pipefail

# install package.json stuffs
export IMAGE_NAME=u3s
/ctx/packages.sh

mkdir -p /etc/rancher/k3s
cat << EOF > /etc/rancher/k3s/kubelet.config
apiVersion: kubelet.config.k8s.io/v1beta1
kind: KubeletConfiguration
shutdownGracePeriod: 30s
shutdownGracePeriodCriticalPods: 10s
EOF

# tweak os-release
sed -i 's/^VARIANT_ID=.*/VARIANT_ID=u3s/' /usr/lib/os-release
sed -i 's/^VARIANT=.*/VARIANT="uCore K3s"/' /usr/lib/os-release