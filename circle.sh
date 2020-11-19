# SHRP building script for CircleCI
# coded by bruh™ aka Live0verfl0w

MANIFEST_LINK=git://github.com/SKYHAWK-Recovery-Project/platform_manifest_twrp_omni.git
BRANCH=android-9.0
DEVICE_CODENAME=dreamlte
GITHUB_USER=Live0verfl0w
GITHUB_EMAIL=vsht700@gmail.com
WORK_DIR=$(pwd)/SHRP-${DEVICE_CODENAME}
JOBS=$(nproc)
SPACE=$(df -h)
RAM=$(free mem -h)

# Check CI specs!
echo "CPU cores = ${JOBS}"
echo "Space available = ${SPACE}"
echo "RAM available = ${RAM}"
sleep 25 

# Set up git!
echo "Setting up git!"
git config --global user.name ${GITHUB_USER}
git config --global user.email ${GITHUB_EMAIL}
git config --global color.ui true

# Install dependencies!
echo "Installing dependencies!"
apt-get -y update && apt-get -y upgrade && apt-get -y install bc bison build-essential curl flex g++-multilib gcc gcc-multilib clang gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev unzip openjdk-8-jdk python ccache libtinfo5 repo libstdc++6 libssl-dev rsync
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

# make directories
echo "Setting work directories!"
mkdir ${WORK_DIR} && cd ${WORK_DIR}

# set up rom repo
echo "Syncing rom repo!"
repo init -u ${MANIFEST_LINK} -b ${BRANCH}
repo sync --current-branch --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j${JOBS}

# clone device sources
echo "Cloning device sources!"

# Device tree
git clone -b android-9.0 https://github.com/Live0verfl0w/shrp_device_samsung_beyond1lte.git device/samsung/beyond1lte 

# Kernel source
git clone -b android-9.0 https://github.com/corsicanu/android_kernel_samsung_universal9820.git kernel/samsung/universal9820

# extra dependencie for building dtbo
git clone -b lineage-16.0 https://github.com/LineageOS/android_hardware_samsung.git hardware/samsung

# Start building!
echo "Starting build!"
export ALLOW_MISSING_DEPENDENCIES=true && source build/envsetup.sh && lunch omni_${DEVICE_CODENAME}-eng && mka recoveryimage -j${JOBS}

echo "Done!"
echo "Build will be uploaded in the artifacts section in CircleCI! =) "