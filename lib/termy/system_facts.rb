require "time"
require "system/getifaddrs"

class Termy::SystemFacts
  attr_reader :info

  def initialize
    @info = {
      date: date,
      machine_id: machine_id,
      boot_id: boot_id,
      os_release: os_release,
      file_systems: file_systems,
    }
  end

  def date
    Time.now
  end

  def boot_id
    f = File.open("/proc/sys/kernel/random/boot_id")
    data = f.read
    f.close
    data
  end

  def file_systems
    file = "/etc/matb"
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
    file = "/etc/os_release"
    os_release = {}
    return os_release unless File.file?(file)

    f = File.open(file)
    f.read.scan(/.*\n/).each do |line|
      key, val = line.split("=")
      os_release[key.downcase] = val.strip
    end
    f.close
    os_release
  end

  def machine_id
    file = "/etc/machine_id"
    return "" unless File.file?(file)

    f = File.open(file)
    machine_id = f.read.strip
    f.close
    machine_id
  end

  def network
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
end
