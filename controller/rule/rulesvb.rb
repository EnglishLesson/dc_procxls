require_relative '../../model/rule/rulesvb'

class RulesVBCtrl
  def initialize
    @rulesvbs = Array.new
  end

  def extractData(sheets)
    for row in sheets
      rulesVBModel = RulesVBModel.new
      next if row.index_in_collection == 0
      rulesVBModel.setCode(row[MdSheet::RulesVBSheet::IDX_CODE])
      rulesVBModel.setCodeRule(row[MdSheet::RulesVBSheet::IDX_RULE])
      rulesVBModel.setCodeVerb(row[MdSheet::RulesVBSheet::IDX_VERB])
      @rulesvbs.push(rulesVBModel)
    end
  end

  def showDataXls()
    for rulesv in @rulesvbs
      puts rulesv.getCode().value
      puts rulesv.getCodeRule().value
      puts rulesv.getCodeVerb().value
    end
  end
end
