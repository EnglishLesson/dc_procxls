#encoding: utf-8

require 'simple_xlsx_reader'
require 'find'

fileXls = nil

Find.find(Dir.home()) do | file |
  next if !(/template.xls[x]$/.match(file.to_s.downcase))
  fileXls = file
end

puts fileXls
