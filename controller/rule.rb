require_relative '../model/rule'

class RuleCtrl
  def initialize
    @rules = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0
      ruleModel = RuleModel.new
      ruleModel.setCode(row[MdSheet::RuleSheet::IDX_CODE])
      ruleModel.setValue(row[MdSheet::RuleSheet::IDX_VALUE])
      ruleModel.setName(row[MdSheet::RuleSheet::IDX_NAME])
      @rules.push(ruleModel)
    end
  end

  def showDataXls()
    for rule in @rules
      puts rule.getCode().value
      puts rule.getValue().value
      puts rule.getName().value
    end
  end
end
