require "termy/system_facts"

RSpec.describe Termy::SystemFacts do |config|
  before do
    @sys_facts = Termy::SystemFacts.new
  end

  after do
    delete_tmp_file
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

  describe "#boot_id" do
    it "should return the boot id" do
      boot_id_file = File.new("/tmp/boot_id_file", "w")
      boot_id_file.write("0992ad15-5af9-49b8-a258-f45dea895414")
      boot_id_file.close
      expect(@sys_facts.get_boot_id("/tmp/boot_id_file")).to eq("0992ad15-5af9-49b8-a258-f45dea895414")
    end
  end

  describe "#get_file_systems" do
    it "should return a file systems hash" do
      tmp_file(<<-EOF
      rootfs / rootfs rw 0 0
      sysfs /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0
      proc /proc proc rw,nosuid,nodev,noexec,relatime 0 0
        EOF
      )
      file_systems = @sys_facts.get_file_systems(Helpers::TMP_NAME)
      expect(file_systems.class).to eq(Hash)
      expect(file_systems.has_key?("sysfs")).to eq(true)
      expect(file_systems["sysfs"]["options"]).to eq(["rw", "nosuid", "nodev", "noexec", "relatime"])
    end

    describe "When a file that doesn't exist is passed" do
      it "should return an empty hash" do
        file_systems = @sys_facts.get_file_systems(Helpers::TMP_NAME)
        expect(file_systems.class).to eq(Hash)
        expect(file_systems.empty?).to eq(true)
      end
    end
  end
end
