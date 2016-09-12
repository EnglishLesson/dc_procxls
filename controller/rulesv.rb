require_relative '../model/rulesv'

class RulesVCtrl
  def initialize
    @rulesvs = Array.new
  end

  def extractData(sheets)
    for row in sheets
      rulesVModel = RulesVModel.new
      next if row.index_in_collection == 0
      rulesVModel.setCode(row[MdSheet::RulesVSheet::IDX_CODE])
      rulesVModel.setCodeRule(row[MdSheet::RulesVSheet::IDX_RULE])
      rulesVModel.setCodeVerb(row[MdSheet::RulesVSheet::IDX_VERB])
      rulesVModel.setRll(row[MdSheet::RulesVSheet::IDX_RLL])
      @rulesvs.push(rulesVModel)
    end
  end

  def showDataXls()
    for rulesv in @rulesvs
      puts rulesv.getCode().value
      puts rulesv.getCodeRule().value
      puts rulesv.getCodeVerb().value
    end
  end
end
