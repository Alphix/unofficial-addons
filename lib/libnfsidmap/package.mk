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

PKG_NAME="libnfsidmap"
PKG_VERSION="0.25"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.citi.umich.edu/projects/nfsv4/linux/"
PKG_URL="http://www.citi.umich.edu/projects/nfsv4/linux/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="network"
PKG_SHORTDESC="libnfsidmap: NFSv4 idmapping library"
PKG_LONGDESC="libnfsidmap provides functions to map between NFSv4 names (which are of the form user@domain) and local uid's and gid's."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

# Shared library doesn't work because libnfsidmap will anyway look for
# shared plugin libraries (which won't be built with --disable-shared

PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_malloc_0_nonnull=yes \
                           --enable-shared \
                           --disable-static \
                           --disable-ldap \
                           --with-pluginpath=../lib/libnfsidmap \
                           --with-gnu-ld"

