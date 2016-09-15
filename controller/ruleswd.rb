require_relative '../model/ruleswd'

class RulesWDCtrl
  def initialize
    @ruleswds = Array.new
  end

  def extractData(sheets)
    for row in sheets
      rulesWD = RulesWDModel.new
      next if row.index_in_collection == 0
      rulesWDModel.setCode(row[MdSheet::RulesWDSheet::IDX_CODE])
      rulesWDModel.setName(row[MdSheet::RulesWDSheet::IDX_NAME])
      rulesWDModel.setCodeRule(row[MdSheet::RulesWDSheet::IDX_CODE_RULE])
      rulesWDModel.setCodeWord(row[MdSheet::RulesWDSheet::IDX_CODE_WORD])
      @ruleswds.push(rulesWDModel)
    end
  end

  def showDataXls()
    for ruleswd in @ruleswds
      puts ruleswd.getCode().value
      puts ruleswd.getName().value
      puts ruleswd.getCodeRule().value
      puts ruleswd.getCodeWord().value
    end
  end
end
