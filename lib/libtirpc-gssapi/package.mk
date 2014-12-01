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

PKG_NAME="libtirpc-gssapi"
BASE_PKG_NAME="libtirpc"
PKG_VERSION="0.2.5"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://sourceforge.net/projects/libtirpc/"
PKG_URL="https://downloads.sourceforge.net/project/libtirpc/libtirpc/$PKG_VERSION/$BASE_PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain krb5"
PKG_PRIORITY="optional"
PKG_SECTION="network"
PKG_SHORTDESC="libtirpc: Transport Independent RPC Library (with GSSAPI)"
PKG_LONGDESC="Libtirpc is a port of Suns Transport-Independent RPC library to Linux. It's being developed by the Bull GNU/Linux NFSv4 project."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared \
                           --enable-static \
                           --disable-silent-rules \
                           --enable-ipv6 \
                           --enable-gssapi \
                           --with-gnu-ld"

export LDFLAGS="$LDFLAGS -Wl,--no-as-needed"

unpack() {
	mkdir -p "$PKG_BUILD"
	tar xfvj $SOURCES/$PKG_NAME/libtirpc-*.tar.bz2 --strip-components=1 -C "$PKG_BUILD"
}

makeinstall_target() {
	$ROOT/$TOOLCHAIN/bin/make -j1 DESTDIR=$SYSROOT_PREFIX/opt/$PKG_NAME install
}

