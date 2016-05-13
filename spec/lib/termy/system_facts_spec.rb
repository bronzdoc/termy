require "termy/system_facts"

RSpec.describe Termy::SystemFacts do |config|
  before do
    @sys_facts = Termy::SystemFacts.new
  end

  describe "#date" do
    it "should return current date" do
      class Time
        def self.now
          "2016-05-12 19:39:15 -0600"
        end
      end
      @sys_facts = Termy::SystemFacts.new
      expect(@sys_facts.date).to eq("2016-05-12 19:39:15 -0600")
    end
  end
end
