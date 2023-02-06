#!/bin/bash

cd /opt/ || exit 1

TAG="v2022.3"

echo "================================"
echo "Install dependencies"
echo "================================"

# Install dependencies needed for src compile
apt install -y git libnl-3-dev libnl-genl-3-dev make pkg-config gcc
if [ $? -ne 0 ]; then
    exit 100
fi

echo "================================"
echo "Install batman-adv"
echo "================================"

# batman-adv
git clone https://github.com/open-mesh-mirror/batman-adv.git && cd batman-adv || exit 1
git checkout ${TAG}

# Enabled debugging/network coding/tracing support
sed -i '/export/s/=n/=y/' Makefile
make -j"$(nproc)"

# Remove old batman-adv module
rmmod batman_adv

# Install new batman-adv module
make install

# Add in autoload batman-adv module
echo "batman-adv" | tee -a /etc/modules
cd /opt/ || exit 1

echo "================================"
echo "Install batctl"
echo "================================"

# batctl
git clone https://github.com/open-mesh-mirror/batctl.git && cd batctl/ || exit 1
git checkout ${TAG}
make -j"$(nproc)"

# Install new batctl
make install

# Add in autoload batman-adv module
echo "batman-adv" >> /etc/modules
cd /opt/ || exit 1

echo "================================"
echo "Install batctl"
echo "================================"

# batctl
git clone https://github.com/open-mesh-mirror/batctl.git && cd batctl/ || exit 1
git checkout ${TAG}
make -j"$(nproc)"

# Install new batctl
make install

echo "================================"
echo "ATTENTION! reboot needed!"
echo "================================"

