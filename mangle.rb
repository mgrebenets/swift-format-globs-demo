#!/usr/bin/env ruby

require "digest"
require "fileutils"

dir = ARGV[0]
Dir["#{dir}/*"].each do |path|
    puts path
    name = path.split("/").last
    hashed_name = Digest::MD5.hexdigest(name)[0..7]
    hashed_path = path.gsub(name, hashed_name)
    puts hashed_path
    FileUtils.mv(path, hashed_path)
end