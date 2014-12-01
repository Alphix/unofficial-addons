################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="nfs-utils"
PKG_VERSION="1.3.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://nfs.sourceforge.net/"
PKG_URL="https://downloads.sourceforge.net/project/nfs/nfs-utils/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libtirpc-gssapi libevent libnfsidmap LVM2 krb5 util-linux"
PKG_PRIORITY="optional"
PKG_SECTION="network"
PKG_SHORTDESC="nfs-utils: NFSv4 utils"
PKG_LONGDESC="nfs-utils provides extra software to use on a NFSv4 client."

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_AUTORECONF="yes"
PKG_MAINTAINER="unofficial.addon.pro"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_malloc_0_nonnull=yes \
                           ac_cv_lib_tirpc_clnt_tli_create=yes \
                           --enable-static \
                           --disable-shared \
                           --disable-svcgss \
                           --enable-tirpc \
                           --disable-nfsdcltrack \
                           --disable-nfsv41 \
                           --without-tcp-wrappers \
                           --with-rpcgen=internal \
                           --enable-ipv6 \
                           --with-statduser=$USER \
                           --with-krb5=$SYSROOT_PREFIX/usr \
                           --with-tirpcinclude=$SYSROOT_PREFIX/opt/libtirpc-gssapi/usr/include/tirpc \
                           --with-gnu-ld"

MAKEFLAGS="-j1"
export LDFLAGS="$LDFLAGS -ldl -L$SYSROOT_PREFIX/opt/libtirpc-gssapi/usr/lib"

addon() {
	mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/sbin
	cp -a $PKG_BUILD/.install_pkg/usr/sbin/rpc.gssd $ADDON_BUILD/$PKG_ADDON_ID/sbin
	cp -a $PKG_BUILD/.install_pkg/usr/sbin/rpc.idmapd $ADDON_BUILD/$PKG_ADDON_ID/sbin
	cp -a $PKG_BUILD/.install_pkg/sbin/{umount,mount}.nfs* $ADDON_BUILD/$PKG_ADDON_ID/sbin

	mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
#	cp -a $(get_build_dir libnfsidmap)/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib
#	cp -a $(get_build_dir krb5)/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib
	cp -a $BUILD/libnfsidmap-0.25/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib
	cp -a $BUILD/krb5-1.13/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib
}

