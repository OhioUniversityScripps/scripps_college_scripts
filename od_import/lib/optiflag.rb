require 'optiflag'

module ServerOptions extend OptiFlagSet
  flag 'input' do
    alternate_forms 'i'
    description "Input file or directory -- all files in directory must be proper CSV files and have the same header_line start position"
  end
  
  optional_flag 'output' do
    alternate_forms 'o'
    description "Output file or directory.  If not provided, output will be routed to the same directory as your input file(s) and will be server_mgr-output"
  end
  
  optional_flag 'header' do
    alternate_forms 'hl'
    description "Line on which header exists within each CSV file.  If not provided, it will be assumed that the header file is on the first line"
  end

  usage_flag 'h', 'help'
  
  and_process!
end