require_relative '../../model/rule/rule'

class RuleCtrl
  def initialize
    @rules = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::RuleSheet::IDX_CODE] == nil || row[MdSheet::RuleSheet::IDX_CODE].value == nil) ||
      (row[MdSheet::RuleSheet::IDX_VALUE] == nil || row[MdSheet::RuleSheet::IDX_VALUE].value == nil) ||
      (row[MdSheet::RuleSheet::IDX_NAME] == nil || row[MdSheet::RuleSheet::IDX_NAME].value == nil)

      ruleModel = RuleModel.new
      ruleModel.setCode(row[MdSheet::RuleSheet::IDX_CODE])
      ruleModel.setValue(row[MdSheet::RuleSheet::IDX_VALUE])
      ruleModel.setName(row[MdSheet::RuleSheet::IDX_NAME])
      @rules.push(ruleModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()

    for rule in @rules
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(rule.getCode().value)
      name = rule.getName().value
      val  = rule.getValue().value
      params = [code, name, val]

      MdDb::RunDB.persistData(MdSheet::RuleSheet::NAME, rule.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for rule in @rules
      puts rule.getCode().value
      puts rule.getValue().value
      puts rule.getName().value
    end
  end
end
