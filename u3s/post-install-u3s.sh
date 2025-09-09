#!/bin/sh

set -ouex pipefail

if [[ -f /usr/share/selinux/packages/k3s.pp ]]; then
    semodule --verbose --install /usr/share/selinux/packages/k3s.pp
fi