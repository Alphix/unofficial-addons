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

PKG_NAME="krb5"
PKG_VERSION="1.13"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="http://web.mit.edu/kerberos/"
PKG_URL="http://web.mit.edu/kerberos/dist/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION-signed.tar"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="network"
PKG_SHORTDESC="krb5: Kerberos5 libraries"
PKG_LONGDESC="Kerberos is a network authentication protocol. It is designed to provide strong authentication for client/server applications by using secret-key cryptography."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

# Kerberos libraries can't really be build static, they depend on support
# routines that are included in separate libs (which will also be
# built static but not expressed as a dependency by krb5-config).

PKG_CONFIGURE_OPTS_TARGET="krb5_cv_attr_constructor_destructor=yes,yes \
                           ac_cv_func_malloc_0_nonnull=yes \
                           ac_cv_func_regcomp=yes \
                           ac_cv_printf_positional=yes \
                           --without-tcl \
                           --enable-shared \
                           --disable-static \
                           --disable-aesni \
                           --without-readline"

unpack() {
	mkdir -p $BUILD/$PKG_NAME
	tar xf $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION-signed.tar -C $BUILD/$PKG_NAME
	tar zxf $BUILD/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz -C $BUILD/$PKG_NAME
	mv -i $BUILD/$PKG_NAME/$PKG_NAME-$PKG_VERSION/src $BUILD/$PKG_NAME-$PKG_VERSION
	rm -rf $BUILD/$PKG_NAME
}

post_makeinstall_target() {
	cp $INSTALL/usr/bin/krb5-config $ROOT/$TOOLCHAIN/bin
}

export LDFLAGS="$LDFLAGS -Wl,--no-as-needed"

