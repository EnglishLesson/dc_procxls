require 'find'
require 'rubyXL'
require 'colorize'

require_relative 'model/entity'
require_relative 'model/noon'
require_relative 'sheet/mdsheet'

fileXls = nil

Find.find("/") do |file|
  next if !(/template.xls[x]$/.match(file.to_s.downcase))
  fileXls = file
  break
end

workbook = RubyXL::Parser.parse(fileXls)

sheets = Array['noon', 'question', 'answer', 'questionnaire', 'keyword', 'punctuation', 'translation',
   'verb', 'gender', 'rule', 'arthicle', 'rulesv', 'rulesn'
]

md = Array[MdSheet::NoonSheet, MdSheet::QuestionSheet, MdSheet::AnswerSheet,MdSheet::QuestionnaireSheet,
  MdSheet::KeywordSheet, MdSheet::PunctuactionSheet, MdSheet::TranslationSheet, MdSheet::VerbSheet, MdSheet::GenderSheet,
  MdSheet::RuleSheet, MdSheet::ArticleSheet, MdSheet::RulesVSheet, MdSheet::RulesNSheet
]

#validate the structure
begin
  for idx in md.rindex(md.first)..md.rindex(md.last)
    for row in workbook[sheets[idx]]
      next if row.index_in_collection == 0
      puts row[md[idx]::IDX_CODE].value
    end
  end
rescue
  puts 'Structure Invalid - sheet\'s name\'s incompatible with the template, please notify the administrator'.red
end
