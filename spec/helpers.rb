module Termy
  module SpecHelpers
    def stub_proc_sys_kernel_random_boot_id
      FileUtils.mkdir_p("/proc/sys/kernel/random/")
      File.open("/proc/sys/kernel/random/boot_id", "w") do |f|
        f.print "0992ad15-5af9-49b8-a258-f45dea895414"
      end
    end

    def stub_etc_matb
      FileUtils.mkdir("/etc")
      File.open("/etc/matb", "w") do |f|
        f.puts "rootfs / rootfs rw 0 0"
        f.puts "sysfs /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0"
        f.puts "proc /proc proc rw,nosuid,nodev,noexec,relatime 0 0"
      end
    end
  end
end
