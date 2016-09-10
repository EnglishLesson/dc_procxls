require 'rubyXL'
require 'find'

require_relative 'model/entity'
require_relative 'model/noon'

fileXls = nil

Find.find("/") do |file|
  next if !(/template.xls[x]$/.match(file.to_s.downcase))
  fileXls = file
  break
end

workbook = RubyXL::Parser.parse(fileXls)

sheets = Array['noon', 'question', 'answer', 'questionnaire']

for sheet in sheets
  puts workbook[sheet].sheet_name
end
