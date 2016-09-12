require 'find'
require 'rubyXL'
require 'colorize'

require_relative 'sheet/mdsheet'

require_relative 'model/entity'

require_relative 'controller/noon'
require_relative 'controller/question'
require_relative 'controller/answer'
require_relative 'controller/questionnaire'
require_relative 'controller/keyword'
require_relative 'controller/punctuation'
require_relative 'controller/translation'
require_relative 'controller/verb'
require_relative 'controller/gender'
require_relative 'controller/rule'
require_relative 'controller/arthicle'
require_relative 'controller/rulesv'
require_relative 'controller/rulesn'

require_relative 'db/mddb'

DATABASE::ConnectDB()

#fileXls = nil

#Find.find("/") do |file|
#  next if !(/template.xls[x]$/.match(file.to_s.downcase))
#  fileXls = file
#  break
#end

#workbook = RubyXL::Parser.parse(fileXls)

#sheets = Array['noon', 'question', 'answer', 'questionnaire', 'keyword', 'punctuation', 'translation',
#   'verb', 'gender', 'rule', 'arthicle', 'rulesv', 'rulesn'
#]

#mdSheet = Array[MdSheet::NoonSheet, MdSheet::QuestionSheet, MdSheet::AnswerSheet,MdSheet::QuestionnaireSheet,
#  MdSheet::KeywordSheet, MdSheet::PunctuactionSheet, MdSheet::TranslationSheet, MdSheet::VerbSheet, MdSheet::GenderSheet,
#  MdSheet::RuleSheet, MdSheet::ArthicleSheet, MdSheet::RulesVSheet, MdSheet::RulesNSheet
#]

#ctrls = Array[NoonCtrl.new, QuestionCtrl.new, AnswerCtrl.new, QuestionnaireCtrl.new, KeywordCtrl.new, PunctuactionCtrl.new,
#  TranslationCtrl.new, VerbCtrl.new, GenderCtrl.new, RuleCtrl.new, ArthicleCtrl.new, RulesVCtrl.new, RulesNCtrl.new
#]

#validate the structure
#begin
#  for idx in mdSheet.rindex(mdSheet.first)..mdSheet.rindex(mdSheet.last)
###  currentInstance.extractData(workbook[currentSheet::NAME])
  #  #ctrls[idx].extractData(workbook[currentSheet::NAME])
  #end
#rescue
#  puts 'Structure Invalid - sheet\'s incompatible with the template, please notify the administrator'.red
#end
