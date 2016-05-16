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
  end

  describe "#os_release", fakefs: true do
    it "reads from /etc/os_release and returns the os info" do
      stub_etc_os_release
      os_release = @sys_facts.os_release
      expect(os_release.class).to eq(Hash)
      expect(os_release.has_key?("name")).to eq(true)
      expect(os_release["name"]).to eq("\"Debian GNU/Linux\"")
    end
  end

  describe "#machine_id", fakefs: true do
    it "reads from /etc/machine_id and returns the id" do
      stub_etc_machine_id
      expect(@sys_facts.machine_id).to eq("57d8918b3961435bb09ed8bff341eb58")
    end
  end

  describe "#network" do
    it "should return network interfaces info" do
      stub_network_interfaces
      network = @sys_facts.network
      expect(network.class).to eq(Hash)
      expect(network.has_key?("my_network_interface")).to eq(true)
    end
  end

end
