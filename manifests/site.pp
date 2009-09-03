import "classes/*"

file { "/etc/network/interfaces": 
   content => "auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
"
}

# TODO : define localhost in /etc/hosts
# TODO : use /var/etc for dhcp
# TODO : create empty /var/log/dmesg
# TODO : add read-only / in fstab

include network::base
include network::dhcp::readonly
include network::ifplugd

include liquidsoap
