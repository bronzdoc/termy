require "termy/version"
require "termy/info"

module Termy
  def self.run!(args)
    info = Termy::Info.new
    if args.size >= 1
      info.show(args)
    else
      info.show_all
    end
  end
end
