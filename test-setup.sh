#!/bin/bash
## test-setup
## - setup bitbake tools and build yocto image for
##   emulation to run on qemu
## version 0.0.2 - case-apt-get
##################################################
. $( dirname ${0} )/sh2/error.sh # error handling
error "true"			 # show errors
##################################################
# test-setup-install-build-host-packages
# - build host packages
# assumptions:
# + build host packages install successfully when
#   proceeded by update
#-------------------------------------------------
test-setup-install-build-host-packages-case-apt-get-list() {
 cat << EOF
gawk
wget
git-core
diffstat
unzip
texinfo
gcc-multilib
build-essential
chrpath
socat
cpio
python
python3
python3-pip
python3-pexpect
xz-utils
debianutils
iputils-ping
libsdl1.2-dev
xterm
EOF
}
test-setup-install-build-host-packages-case-apt-get() {
 sudo apt-get update -y 
 sudo apt-get install $( ${FUNCNAME}-list ) -y
}
test-setup-install-build-host-packages-case() {
 case $( uname -a ) in
  Linux*Ubuntu|Linux*Debian) {
   ${FUNCNAME}-apt-get
  } ;; 
  *) {
   false || {
    error "build host packages not yet implemented for '$( uname -a )'" "${FUNCNAME}" "${LINENO}"
    false
   }
  }
}
test-setup-install-build-host-packages() {
 ${FUNCNAME}-case
}
#-------------------------------------------------
# test-setup-get-poky
# - get yocto poky
# assertion: packages installed successfully
# to do:
# + get latest version, using v2.4 for now
test-setup-get-poky() {
 git clone git://git.yoctoproject.org/poky
 cd poky
 git checkout tags/yocto-2.4 -b poky_2.4 
}
#-------------------------------------------------
# test-setup-build
# - build for emulation
# assertion: in ~/poky
# to do:
# + finish implementation left in comments
# ++ ex) configure 'poky...
test-setup-build() {
 git checkout -b rocko origin/rocko
 ## initialize build environment
 source oe-init-build-env 
 # configure 'poky/build/conf/local.conf'
 bitbake core-image-minimal
 # run 'runqemu qemux86'
 # stop qemu Ctrl-C
}
#-------------------------------------------------
test-setup-initialize() {
 cd ~ # go homes
}
#-------------------------------------------------
test-setup() {
 ${FUNCNAME}-initialize
 ${FUNCNAME}-install-build-host-packages
 ${FUNCNAME}-get-poky
 ${FUNCNAME}-build
}
##################################################
if [ ${#} -eq 0 ] 
then
 true
else
 exit 1 # wrong args
fi
##################################################
test-setup
##################################################
## generated by create-stub2.sh v0.1.1
## on Fri, 27 Apr 2018 13:56:39 +0900
## see <https://github.com/temptemp3/sh2>
##################################################
