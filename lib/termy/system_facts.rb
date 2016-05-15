require "time"

class Termy::SystemFacts
  attr_reader :date, :boot_id, :file_systems

  def initialize
    @date = get_date
    @boot_id = get_boot_id
    @file_systems = get_file_systems
  end

  def get_date
    Time.now
  end

  def get_boot_id
    f = File.open("/proc/sys/kernel/random/boot_id")
    data = f.read
    f.close
    data
  end

  def get_file_systems
    file = "/etc/matb"
    file_systems = {}
    return file_systems unless File.file?(file)

    f = File.open(file)
    f.read.scan(/.*\n/).each do |line|
      record = line.strip.split(" ")
      file_systems[record.first] = {
        "device"      =>  record[0],
        "mount_point" =>  record[1],
        "type"        =>  record[2],
        "options"     =>  record[3].split(","),
        "dump_freq"   =>  record[4],
        "pass_no"     =>  record[5],
      }
    end
    f.close
    file_systems
  end
end
