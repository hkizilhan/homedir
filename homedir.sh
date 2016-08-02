#! /bin/sh
### BEGIN INIT INFO
# Provides:          homedir
# Required-Start:
# Required-Stop:
# Should-Start:      glibc
# Default-Start:     S
# Default-Stop:
# Short-Description: Set homedir
# Description:       Read the machines hostname from /etc/hostname, and
#                    update the kernel value with this value.  If
#                    /etc/hostname is empty, the current kernel value
#                    for hostname is used.  If the kernel value is
#                    empty, the value 'localhost' is used.
### END INIT INFO

# Version 0.01

# Usage: Prepare home directory for freeze. Copy Home directory to
# backup location. 
#
# UBUNTU
#
# copy this init.d script to /etc/init.d, set executable bit
# run sudo update-rc.d homedir defaults
#



PATH=/sbin:/bin

. /lib/init/vars.sh
. /lib/lsb/init-functions

do_start () {

	#touch /filefile.hakkan
	rm -rf /home/kutuphane
	cp -arf /home_dir/kutuphane  /home/

	chown -R kutuphane:kutuphane /home/kutuphane

	exit 0
}

do_status () {
	HOSTNAME=$(hostname)
	if [ "$HOSTNAME" ] ; then
		return 0
	else
		return 4
	fi
}

case "$1" in
  start|"")
	do_start
	;;
  restart|reload|force-reload)
	echo "Error: argument '$1' not supported" >&2
	exit 3
	;;
  stop)
	# No-op
	;;
  status)
	do_status
	exit $?
	;;
  *)
	echo "Usage: hostname.sh [start|stop]" >&2
	exit 3
	;;
esac

:
