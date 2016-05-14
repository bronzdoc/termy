require "time"

class Termy::SystemFacts
  attr_reader :date, :boot_id

  def initialize
    @date = get_date
    @boot_id = get_boot_id("/proc/sys/kernel/random/boot_id")
  end

  def get_date
    Time.now
  end

  def get_boot_id(file)
    file = File.open(file)
    data = file.read
    file.close
    data
  end

  def get_file_systems(file)
    file_systems = {}
    f = File.open(file) if File.file?(file)

    f.read.scan(/.*\s/).each do |line|
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
    file_systems
  end
end
