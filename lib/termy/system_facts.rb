require "time"
require "system/getifaddrs"
require "sys/uname"

class Termy::SystemFacts
  attr_reader :kernel

  def initialize
    @kernel =  {
      "name" => uname[:sysname],
      "release" => uname[:release],
      "version" => uname[:version]
    }
  end

  def date
    Time.now
  end

  def boot_id
    f = File.open("/proc/sys/kernel/random/boot_id")
    data = f.read.strip
    f.close
    data
  end

  def file_systems
    file = "/etc/mtab"
    file_systems = {}
    return file_systems unless File.file?(file)

    f = File.open(file)
    f.read.scan(/.*\n/).each do |line|
      record = line.strip.split(" ")
      file_systems[record.first] = {
        "device"      => record[0],
        "mount_point" => record[1],
        "type"        => record[2],
        "options"     => record[3].split(","),
        "dump_freq"   => record[4],
        "pass_no"     => record[5],
      }
    end
    f.close
    file_systems
  end

  def os_release
    file = "/etc/os-release"
    os_release = {}
    return os_release unless File.file?(file)

    f = File.open(file)
    f.read.scan(/.*\n/).each do |line|
      key, val = line.split("=")
      os_release[key.downcase] = val.strip.gsub("\"","")
    end
    f.close
    os_release
  end

  def machine_id
    file = "/etc/machine-id"
    return "" unless File.file?(file)

    f = File.open(file)
    machine_id = f.read.strip
    f.close
    machine_id
  end

  def network
    # TODO refactor this in the near future
    interfaces = {}
    System.get_all_ifaddrs.each do |info|
      key = info[:interface]
      if interfaces.has_key?(key)
        interfaces[key]["ip_addresses"] << info[:inet_addr].to_s
        if info[:inet_addr].ipv4?
          interfaces[key]["ipv4_adresses"] << {
            "ip" => info[:inet_addr].to_s,
            "netmask" => info[:netmask].to_s
          }
        elsif info[:inet_addr].ipv6?
          interfaces[key]["ipv6_adresses"] << {
            "ip" => info[:inet_addr].to_s,
            "netmask" => info[:netmask].to_s
          }
        end
      else
        interfaces[key] = {
          "name" => key,
          "ip_addresses" => [info[:inet_addr].to_s],
          "ipv4_adresses" => [],
          "ipv6_adresses" => [],
        }
        if info[:inet_addr].ipv4?
          interfaces[key]["ipv4_adresses"] << {
            "ip" => info[:inet_addr].to_s,
            "netmask" => info[:netmask].to_s
          }
        elsif info[:inet_addr].ipv6?
          interfaces[key]["ipv6_adresses"] << {
            "ip" => info[:inet_addr].to_s,
            "netmask" => info[:netmask].to_s
          }
        end
      end
    end
    interfaces
  end

  private
  def uname
    Sys::Uname.uname.to_h
  end
end
