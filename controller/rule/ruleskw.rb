require_relative '../../model/rule/ruleskw'

class RulesKWCtrl
  def initialize
    @ruleskws = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 || row[MdSheet::RulesKWSheet::IDX_CODE] == nil ||
        row[MdSheet::RulesKWSheet::IDX_CODE_RULE] == nil || row[MdSheet::RulesKWSheet::IDX_CODE_KEYWORD] == nil ||
          row[MdSheet::RulesKWSheet::IDX_CODE_EXCEPTION] == nil

      rulesKWModel = RulesKWModel.new
      rulesKWModel.setCode(row[MdSheet::RulesKWSheet::IDX_CODE])

      ruleId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::RuleSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::RulesKWSheet::IDX_CODE_RULE].value()))
      rulesKWModel.setRuleId(ruleId)

      keywordId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::KeywordSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::RulesKWSheet::IDX_CODE_KEYWORD].value()))
      rulesKWModel.setKeywordId(keywordId)

      exceptionId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::ExceptionSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::RulesKWSheet::IDX_CODE_EXCEPTION].value()))
      rulesKWModel.setExceptionId(exceptionId)

      @ruleskws.push(rulesKWModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    MdDb::RunDB.connect()

    for ruleskw in @ruleskws
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(ruleskw.getCode().value)
      params = [code, ruleskw.getRuleId(), ruleskw.getKeywordId(), ruleskw.getExceptionId()]

      MdDb::RunDB.persistData(MdSheet::RulesKWSheet::NAME, ruleskw.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for ruleskw in @ruleskws
      puts ruleskw.getCode().value
      puts ruleskw.getRuleId().value
      puts ruleskw.getKeywordId().value
    end
  end
end
