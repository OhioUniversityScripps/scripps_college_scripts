#!/usr/local/bin/ruby
TEST = false

=begin
  * Name:         OU-MDIA Server Management Tool
  * Description:  Take incoming CSV files (provided by OU registar) and output
                  the proper format for use with Mac OS X Server's Workgroup
                  Manger
  * Author:       Richard Chilcott
  * Date:         07/10/08
=end

# Require external libraries
require "rubygems"
require "bundler/setup"
require "erb"
require "csv"

# Require helper files
require './lib/optiflag.rb'
require './lib/server_mgr_helpers.rb'
require './lib/user.rb'

@input_files = []
@header_line = 0

def process_options
  #Process tags, set options, and validate
  if ARGV.flags.input?
    if File.directory?(ARGV.flags.input)
      directory = ARGV.flags.input
      #loop through directory and build files list
      Dir["#{directory}/*"].each do | file |
        @input_files << file
      end
    else
      file = ARGV.flags.input
      #its only a single file.. but let's make sure it exists
      if File.exists?(file)
        @input_files << file
      else
        error_msg"#{file} does not exist"
      end
    end
  end

  if ARGV.flags.output?
    #validate as a directory
    if File.directory?(ARGV.flags.output)
      #if it is a directory, append ouput to the directory and be done
      @output_file = ARGV.flags.output + "/server_mgr-output"
    elsif File.exists?(ARGV.flags.output)
      @output_file = ARGV.flags.output
      puts "You are overwriting #{@output_file}!!"
    else
       #It doesn't exist, its not a directory, so just write to it
      @output_file = ARGV.flags.output
    end
  end

  #if there were no options specified for output, then set it to the
  #same directory as the input file
  @output_file ||= "#{File.dirname(@input_files[0])}/server_mgr-output"

  if ARGV.flags.header?
    @header_line = ARGV.flags.header
    error_msg("header_line must be a number") unless @header_line == @header_line.to_i.to_s
  end

  true
end

def populate_users_from_file(filename)
  users_return_array = []

  CSV.foreach(filename, headers: true, header_converters: :symbol) do |line|
    new_user = User.new(line)
    users_return_array << new_user #if new_user.valid?
  end

  error_msg NO_USERS_ERR_MSG  if users_return_array.empty?

  users_return_array
end

def build_output(users)
  template = ""
  @users = users #passed into template
  File.open("./lib/output.template.erb", "r") do |file|
    while line = file.gets
      template += line
    end
  end

  template.gsub!(/^  /, '')

  message = ERB.new(template, 0, "%<>")
  return message.result
end

process_options
users_array = []
puts "\nConverting #{@input_files.join ','}..."
execute(error_message: CONVERTING_FILES_ERR_MSG) do
  for file in @input_files
    users_array += populate_users_from_file(file)
  end
end

puts "\nBuilding output..."
output = nil
execute(error_message: BUILD_OUTPUT_ERR_MSG) do
   output = build_output(users_array)
end

puts "\nWriting to #{@output_file}..."
execute(error_message: WRITING_ERR_MSG) do
  write_file(@output_file, output)
end

puts "\nFinished!"