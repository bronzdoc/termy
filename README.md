# Termy [![Build Status](https://travis-ci.org/bronzdoc/termy.svg?branch=master)](https://travis-ci.org/bronzdoc/termy)
Get facts about a Linux system.

## Installation

```
$ gem install termy
```

## Usage

### Print a single fact
```
$ termy system:kernel

{
  "name": "Linux",
  "release": "3.16.0-4-amd64",
  "version": "#1 SMP Debian 3.16.7-ckt25-2 (2016-04-08)"
}
```

### Print all facts
```
$ termy

{
  "system": {
    "architecture": "x86_64",
    "boot_id": "375bb137-321e-4554-b0ed-d28aa511b539",
    "date": "2016-05-16 23:04:50 -0600",
    "domainname": "(none)",
    "hostname": "doczilla",
    "network": {
      "lo": {
        "name": "lo",
        "ip_addresses": [
          "127.0.0.1",
          "::1"
        ],
        "ipv4_adresses": [
          {
            "ip": "127.0.0.1",
            "netmask": "255.0.0.0"
          }
        ],
        "ipv6_adresses": [
          {
            "ip": "::1",
            "netmask": "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff"
          }
        ]
      },
      "wlan0": {
        "name": "wlan0",
        "ip_addresses": [
          "192.168.1.4",
          "fe80::3602:86ff:fe95:6e01"
        ],
        "ipv4_adresses": [
          {
            "ip": "192.168.1.4",
            "netmask": "255.255.255.0"
          }
        ],
        "ipv6_adresses": [
          {
            "ip": "fe80::3602:86ff:fe95:6e01",
            "netmask": "ffff:ffff:ffff:ffff::"
          }
        ]
      },
      "docker0": {
        "name": "docker0",
        "ip_addresses": [
          "172.17.0.1"
        ],
        "ipv4_adresses": [
          {
            "ip": "172.17.0.1",
            "netmask": "255.255.0.0"
          }
        ],
        "ipv6_adresses": [

        ]
      }
    },
    "file_systems": {
      "rootfs": {
        "device": "rootfs",
        "mount_point": "/",
        "type": "rootfs",
        "options": [
          "rw"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "sysfs": {
        "device": "sysfs",
        "mount_point": "/sys",
        "type": "sysfs",
        "options": [
          "rw",
          "nosuid",
          "nodev",
          "noexec",
          "relatime"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "proc": {
        "device": "proc",
        "mount_point": "/proc",
        "type": "proc",
        "options": [
          "rw",
          "nosuid",
          "nodev",
          "noexec",
          "relatime"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "udev": {
        "device": "udev",
        "mount_point": "/dev",
        "type": "devtmpfs",
        "options": [
          "rw",
          "relatime",
          "size=10240k",
          "nr_inodes=981691",
          "mode=755"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "devpts": {
        "device": "devpts",
        "mount_point": "/dev/pts",
        "type": "devpts",
        "options": [
          "rw",
          "nosuid",
          "noexec",
          "relatime",
          "gid=5",
          "mode=620",
          "ptmxmode=000"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "tmpfs": {
        "device": "tmpfs",
        "mount_point": "/run/user/1000",
        "type": "tmpfs",
        "options": [
          "rw",
          "nosuid",
          "nodev",
          "relatime",
          "size=787240k",
          "mode=700",
          "uid=1000",
          "gid=1000"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "/dev/sda7": {
        "device": "/dev/sda7",
        "mount_point": "/",
        "type": "ext4",
        "options": [
          "rw",
          "relatime",
          "errors=remount-ro",
          "data=ordered"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "securityfs": {
        "device": "securityfs",
        "mount_point": "/sys/kernel/security",
        "type": "securityfs",
        "options": [
          "rw",
          "nosuid",
          "nodev",
          "noexec",
          "relatime"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "cgroup": {
        "device": "cgroup",
        "mount_point": "/sys/fs/cgroup/perf_event",
        "type": "cgroup",
        "options": [
          "rw",
          "nosuid",
          "nodev",
          "noexec",
          "relatime",
          "perf_event"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "pstore": {
        "device": "pstore",
        "mount_point": "/sys/fs/pstore",
        "type": "pstore",
        "options": [
          "rw",
          "nosuid",
          "nodev",
          "noexec",
          "relatime"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "systemd-1": {
        "device": "systemd-1",
        "mount_point": "/proc/sys/fs/binfmt_misc",
        "type": "autofs",
        "options": [
          "rw",
          "relatime",
          "fd=22",
          "pgrp=1",
          "timeout=300",
          "minproto=5",
          "maxproto=5",
          "direct"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "hugetlbfs": {
        "device": "hugetlbfs",
        "mount_point": "/dev/hugepages",
        "type": "hugetlbfs",
        "options": [
          "rw",
          "relatime"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "mqueue": {
        "device": "mqueue",
        "mount_point": "/dev/mqueue",
        "type": "mqueue",
        "options": [
          "rw",
          "relatime"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "debugfs": {
        "device": "debugfs",
        "mount_point": "/sys/kernel/debug",
        "type": "debugfs",
        "options": [
          "rw",
          "relatime"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "fusectl": {
        "device": "fusectl",
        "mount_point": "/sys/fs/fuse/connections",
        "type": "fusectl",
        "options": [
          "rw",
          "relatime"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "rpc_pipefs": {
        "device": "rpc_pipefs",
        "mount_point": "/run/rpc_pipefs",
        "type": "rpc_pipefs",
        "options": [
          "rw",
          "relatime"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      },
      "gvfsd-fuse": {
        "device": "gvfsd-fuse",
        "mount_point": "/run/user/1000/gvfs",
        "type": "fuse.gvfsd-fuse",
        "options": [
          "rw",
          "nosuid",
          "nodev",
          "relatime",
          "user_id=1000",
          "group_id=1000"
        ],
        "dump_freq": "0",
        "pass_no": "0"
      }
    },
    "os_release": {
      "pretty_name": "Debian GNU/Linux 8 (jessie)",
      "name": "Debian GNU/Linux",
      "version_id": "8",
      "version": "8 (jessie)",
      "id": "debian",
      "home_url": "http://www.debian.org/",
      "support_url": "http://www.debian.org/support",
      "bug_report_url": "https://bugs.debian.org/"
    },
    "kernel": {
      "name": "Linux",
      "release": "3.16.0-4-amd64",
      "version": "#1 SMP Debian 3.16.7-ckt25-2 (2016-04-08)"
    },
    "machine_id": "87d7918b2961434bb05ed8bff341eb59"
  }
}

```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
