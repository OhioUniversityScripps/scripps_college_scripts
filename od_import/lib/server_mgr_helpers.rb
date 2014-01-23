#Common Error Messages
CHECK_FILES_AND_HEADERS = "  Please check to make sure ALL files are in the proper format -- they have the correct headers and follow the CSV standard.  Also ensure you have the -header_line argument set if it needs it."
NO_USERS_ERR_MSG = "No users were populated." + CHECK_FILES_AND_HEADERS
BUILD_OUTPUT_ERR_MSG = "There was an error in building the output." + CHECK_FILES_AND_HEADERS
WRITING_ERR_MSG = "There was an error in writing.  Make sure the destination file is not in use and try again."
CONVERTING_FILES_ERR_MSG = "There was an error in coverting your files." + CHECK_FILES_AND_HEADERS

def error_msg(msg, level=:error)
  puts ""
  puts level.to_s.upcase + ": " + msg
  puts "\nRun -help for argument help"

  if level == :error or :level == :exit
    exit
  end
end

def write_file(out_file, output)
  output_file = File.new(out_file, "w")
  output_file.write(output)
  output_file.close
end

def execute(opts = {}, &block)
  if TEST
    yield
  else
    begin
      yield
    rescue
      error_msg opts[:error_message]
    end
  end
end

class Integer
  def to_bytes_from_mb
    self * 1048576
  end

  def to_bytes_from_gb
    self * 1073741824
  end
end

class Float
  def to_bytes_from_mb
    self * 1048576
  end

  def to_bytes_from_gb
    self * 1073741824
  end
end