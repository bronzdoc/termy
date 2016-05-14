module Helpers
  TMP_NAME = "/tmp/test_file"

  def tmp_file(content)
    file = File.new(Helpers::TMP_NAME, "w")
    file.write(content)
    file.close
  end

  def delete_tmp_file
    if File.file?(Helpers::TMP_NAME)
      require "fileutils"
      FileUtils.rm(Helpers::TMP_NAME)
    end
  end
end
