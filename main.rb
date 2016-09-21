require 'find'
require 'rubyXL'
require 'colorize'

require_relative 'sheet/mdsheet'

fileXls = nil

Find.find("/") do |file|
  next if !(/template.xls[x]$/.match(file.to_s.downcase))
  fileXls = file
  break
end

workbook = RubyXL::Parser.parse(fileXls)

mdSheet = Array[MdSheet::CodesTSheet, MdSheet::RuleSheet, MdSheet::GenderSheet, MdSheet::TranslationSheet, MdSheet::ExceptionSheet,
  MdSheet::WordSheet, MdSheet::RulesWDSheet, MdSheet::VerbSheet, MdSheet::RulesVBSheet, MdSheet::NounSheet, MdSheet::RulesNNSheet,
  MdSheet::PrepositionSheet, MdSheet::TKeywordSheet, MdSheet::KeywordSheet, MdSheet::RulesKWSheet, MdSheet::NumberSheet,
  MdSheet::AdjectiveSheet, MdSheet::PronounSheet, MdSheet::AnswerSheet, MdSheet::QuestionSheet, MdSheet::QuestionnaireSheet,
  MdSheet::TranslWDSheet, MdSheet::TranslVBSheet, MdSheet::TranslKWSheet, MdSheet::TranslNNSheet, MdSheet::TranslPPSheet,
  MdSheet::TranslNBSheet, MdSheet::TranslADJSheet, MdSheet::TranslPronSheet
]

#validate the structure
begin
  for idx in mdSheet.rindex(mdSheet.first)..mdSheet.rindex(mdSheet.last)
    currentSheet = mdSheet[idx]
    currentInstance = currentSheet::INSTANCE
    currentInstance.extractData(workbook[currentSheet::NAME])
    currentInstance.persistData()
  end
rescue
  puts 'Structure Invalid - sheet\'s incompatible with the template, please notify the administrator'.red
end
