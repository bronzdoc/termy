require "time"

class Termy::SystemFacts
  attr_reader :date

  def initialize
    @date = get_date
  end

  private
  def get_date
    Time.now
  end
end
