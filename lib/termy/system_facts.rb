require "time"

class Termy::SystemFacts
  def initialize
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
end
