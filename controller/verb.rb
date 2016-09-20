require_relative '../model/verb'

class VerbCtrl
  def initialize
    @verbs = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 || row[MdSheet::VerbSheet::IDX_CODE] == nil ||
        row[MdSheet::VerbSheet::IDX_VALUE] == nil

      verbModel = VerbModel.new
      verbModel.setCode(row[MdSheet::VerbSheet::IDX_CODE])
      verbModel.setValue(row[MdSheet::VerbSheet::IDX_VALUE])
      @verbs.push(verbModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()

    for verb in @verbs
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(verb.getCode().value)
      value = MdDb::DBUtil::INSTANCE.getStringFormat(verb.getValue().value)
      params = [code, value]

      MdDb::RunDB.persistData(MdSheet::VerbSheet::NAME, verb.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end


  def showDataXls()
    for verb in @verbs
      puts verb.getCode().value
      puts verb.getValue().value
    end
  end
end
