require_relative '../../model/rule/rulesnn'

class RulesNNCtrl
  def initialize
    @rulesnns = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 || row[MdSheet::RulesNNSheet::IDX_CODE] == nil ||
        row[MdSheet::RulesNNSheet::IDX_CODE_RULE] == nil || row[MdSheet::RulesNNSheet::IDX_CODE_NOUN] == nil ||
          row[MdSheet::RulesNNSheet::IDX_CODE_EXCEPTION] == nil

      rulesNNModel = RulesNNModel.new
      rulesNNModel.setCode(row[MdSheet::RulesNNSheet::IDX_CODE])

      ruleId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::RuleSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::RulesNNSheet::IDX_CODE_RULE].value()))
      rulesNNModel.setRuleId(ruleId)

      nounId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::NounSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::RulesNNSheet::IDX_CODE_NOUN].value()))
      rulesNNModel.setNounId(nounId)

      exceptionId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::ExceptionSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::RulesNNSheet::IDX_CODE_EXCEPTION].value()))
      rulesNNModel.setExceptionId(exceptionId)

      @rulesnns.push(rulesNNModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    MdDb::RunDB.connect()

    for rulesnn in @rulesnns
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(rulesnn.getCode().value)
      params = [code, rulesnn.getRuleId(), rulesnn.getNounId(), rulesnn.getExceptionId()]

      MdDb::RunDB.persistData(MdSheet::RulesNNSheet::NAME, rulesnn.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for rulesnn in @rulesnns
      puts rulesnn.getCode().value
      puts rulesnn.getRuleId().value
      puts rulesnn.getNounId().value
      puts rulesnn.getExceptionId().value
    end
  end
end
