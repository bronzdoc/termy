require "termy/system_facts"
require "json"

module Termy
  class Info
    attr_reader :info
    def initialize
      sf = Termy::SystemFacts.new
      @info = {
        "system" => {
          "architecture" => sf.arch,
          "boot_id" => sf.boot_id,
          "date" => sf.date,
          "domainname" => sf.domainname,
          "hostname" => sf.hostname,
          "network" => sf.network,
          "file_systems" => sf.file_systems,
          "os_release" => sf.os_release,
          "kernel" => sf.kernel,
          "machine_id" => sf.machine_id,
        }
      }
    end

    def show_all
      puts JSON.pretty_generate(@info)
    end

    def show(user_info_keys)
      keys = user_info_keys.first.split(":")
      info_keys = @info.keys

      info = @info
      data = nil
      begin
      keys.each do |key|
        data = info[key]
        info = data.is_a?(String) ? { key => data } : data
        raise key if info.nil?
      end
      rescue => e
        puts "InvalidKeyError: key \"#{e}\" not found"
        exit
      end
      puts JSON.pretty_generate(info)
    end
  end
end
