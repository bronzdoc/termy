module Termy
  module SpecHelpers
    def stub_proc_sys_kernel_random_boot_id
      FileUtils.mkdir_p("/proc/sys/kernel/random/")
      File.open("/proc/sys/kernel/random/boot_id", "w") do |f|
        f.puts "0992ad15-5af9-49b8-a258-f45dea895414"
      end
    end

    def stub_etc_mtab
      FileUtils.mkdir("/etc")
      File.open("/etc/mtab", "w") do |f|
        f.puts "rootfs / rootfs rw 0 0"
        f.puts "sysfs /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0"
        f.puts "proc /proc proc rw,nosuid,nodev,noexec,relatime 0 0"
      end
    end

    def stub_etc_os_release
      FileUtils.mkdir("/etc")
      File.open("/etc/os_release", "w") do |f|
        f.puts 'PRETTY_NAME="Debian GNU/Linux 8 (jessie)"'
        f.puts 'NAME="Debian GNU/Linux"'
        f.puts 'VERSION_ID="8"'
        f.puts 'VERSION="8 (jessie)"'
        f.puts 'ID=debian'
        f.puts 'HOME_URL="http://www.debian.org/"'
        f.puts 'SUPPORT_URL="http://www.debian.org/support"'
        f.puts 'BUG_REPORT_URL="https://bugs.debian.org/"'
      end
    end

    def stub_etc_machine_id
      FileUtils.mkdir("/etc")
      File.open("/etc/machine-id", "w") do |f|
        f.puts "57d8918b3961435bb09ed8bff341eb58"
      end
    end

    def stub_network_interfaces
      require "system/getifaddrs"
      System.class_eval do
        def self.get_all_ifaddrs
          [
            {
              :interface => "my_network_interface",
              :inet_addr => IPAddr.new,
              :netmask => IPAddr.new
            }
          ]
        end
      end
    end
  end
end
