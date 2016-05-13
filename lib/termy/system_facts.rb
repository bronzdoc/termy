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
end
