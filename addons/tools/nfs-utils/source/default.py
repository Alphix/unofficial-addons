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

import os
import xbmcaddon
import subprocess

__addon__ = xbmcaddon.Addon()
__path__  = __addon__.getAddonInfo('path')

subprocess.call('chmod +x ' + __path__ + '/sbin/*', shell=True, close_fds=True)
subprocess.call('chmod +x ' + __path__ + '/bin/*', shell=True, close_fds=True)

for link in ['mount.nfs4', 'umount.nfs', 'umount.nfs4']:
	if not os.path.exists(__path__ + '/bin/' + link):
		subprocess.call('ln -sf ' + __path__ + '/bin/mount.nfs ' + __path__ + '/bin/' + link, shell=True, close_fds=True)

if not os.path.exists('/storage/.config/nfs'):
	subprocess.call('mkdir -p /storage/.config/nfs', shell=True, close_fds=True)
	subprocess.call('cp -a ' + __path__ + '/config/idmap.conf.example /storage/.config/nfs', shell=True, close_fds=True)
	subprocess.call('cp -a ' + __path__ + '/config/krb5.* /storage/.config/nfs', shell=True, close_fds=True)

if not os.path.exists('/storage/.config/request-key.d'):
	subprocess.call('mkdir -p /storage/.config/request-key.d', shell=True, close_fds=True)

if not os.path.exists('/storage/.config/request-key.d/id_resolver.conf'):
	subprocess.call('cp -a ' + __path__ + '/config/id_resolver.conf /storage/.config/request-key.d', shell=True, close_fds=True)
