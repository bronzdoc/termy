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

  describe "#boot_id", fakefs: true do
    it "reads /proc/sys/kernel/random/boot_id and returns the boot_id string" do
      stub_proc_sys_kernel_random_boot_id
      expect(@sys_facts.boot_id).to eq("0992ad15-5af9-49b8-a258-f45dea895414")
    end
  end

  describe "#file_systems", fakefs: true do
    it "reads /etc/matb and returns the file systems info as a hash" do
      stub_etc_matb
      file_systems = @sys_facts.file_systems
      expect(file_systems.class).to eq(Hash)
      expect(file_systems.has_key?("sysfs")).to eq(true)
      expect(file_systems["sysfs"]["options"]).to eq(["rw", "nosuid", "nodev", "noexec", "relatime"])
    end

    describe "When a file that doesn't exist is passed" do
      it "should return an empty hash" do
        file_systems = @sys_facts.file_systems
        expect(file_systems.class).to eq(Hash)
        expect(file_systems.empty?).to eq(true)
      end
    end
  end
end
