#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init --depth=1 -u https://github.com/Project-Kizashi/android.gi -b relay --git-lfs

echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/kaspesk/local_manifests --depth 1 -b kizashi .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=kaspesk
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch lunch kasumi_channel-userdebug
echo "============="

# Build rom
mka bandori
