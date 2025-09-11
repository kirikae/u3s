#!/bin/sh

set -ouex pipefail

ls -lah /ctx/

# install package.json stuffs
export IMAGE_NAME=u3s
/ctx/packages.sh

mv /usr/bin/calicoctl-linux-amd64 /usr/bin/kubectl-calico
tar xvf /ctx/${HELM_BINARY_TARBALL} linux-amd64/helm
mv linux-amd64/helm /usr/bin/
chmod 0755 /usr/bin/helm

# tweak os-release
sed -i 's/^VARIANT_ID=.*/VARIANT_ID=u3s/' /usr/lib/os-release
sed -i 's/^VARIANT=.*/VARIANT="uCore K3s"/' /usr/lib/os-release