#!/bin/sh

set -ouex pipefail

if [[ -f /usr/share/selinux/packages/k3s.pp ]]; then
    semodule --verbose --install /usr/share/selinux/packages/k3s.pp
fi

firewall-cmd --permanent --add-port=8472/udp # Flannel VXLAN
firewall-cmd --permanent --add-port=10250/tcp # Kubelet metrics
firewall-cmd --permanent --add-port=51810-51821/udp # Flannel wireguard IPv4 & IPv6