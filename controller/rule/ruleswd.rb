require_relative '../../model/rule/ruleswd'

class RulesWDCtrl
  def initialize
    @ruleswds = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::RulesWDSheet::IDX_CODE] == nil || row[MdSheet::RulesWDSheet::IDX_CODE].value == nil) ||
      (row[MdSheet::RulesWDSheet::IDX_CODE_RULE] == nil || row[MdSheet::RulesWDSheet::IDX_CODE_RULE].value == nil) ||
      (row[MdSheet::RulesWDSheet::IDX_CODE_WORD] == nil || row[MdSheet::RulesWDSheet::IDX_CODE_WORD].value == nil)

      rulesWDModel = RulesWDModel.new
      rulesWDModel.setCode(row[MdSheet::RulesWDSheet::IDX_CODE])

      ruleId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::RuleSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::RulesWDSheet::IDX_CODE_RULE].value()))
      rulesWDModel.setRuleId(ruleId)

      wordId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::WordSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::RulesWDSheet::IDX_CODE_WORD].value()))

      rulesWDModel.setWordId(wordId)

      @ruleswds.push(rulesWDModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    MdDb::RunDB.connect()

    for ruleswd in @ruleswds
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(ruleswd.getCode().value)
      params = [code, ruleswd.getRuleId(), ruleswd.getWordId()]

      MdDb::RunDB.persistData(MdSheet::RulesWDSheet::NAME, ruleswd.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for ruleswd in @ruleswds
      puts ruleswd.getCode().value
      puts ruleswd.getRuleId()
      puts ruleswd.getWordId()
    end
  end
end
