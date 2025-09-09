#!/bin/sh

set -ouex pipefail

# install package.json stuffs
export IMAGE_NAME=u3s
/ctx/packages.sh

# tweak os-release
sed -i 's/^VARIANT_ID=.*/VARIANT_ID=u3s/' /usr/lib/os-release
sed -i 's/^VARIANT=.*/VARIANT="uCore K3s"/' /usr/lib/os-release