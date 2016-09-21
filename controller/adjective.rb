require_relative '../model/adjective'

class AdjectiveCtrl

  def initialize
    @adjectives = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 || row[MdSheet::AdjectiveSheet::IDX_CODE] == nil ||
        row[MdSheet::AdjectiveSheet::IDX_VALUE] == nil

      adjectiveModel = AdjectiveModel.new
      adjectiveModel.setCode(row[MdSheet::AdjectiveSheet::IDX_CODE])
      adjectiveModel.setValue(row[MdSheet::AdjectiveSheet::IDX_VALUE])
      @adjectives.push(adjectiveModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()

    for adjective in @adjectives
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(adjective.getCode().value)
      value = MdDb::DBUtil::INSTANCE.getStringFormat(adjective.getValue().value)
      params = [code, value]

      MdDb::RunDB.persistData(MdSheet::AdjectiveSheet::NAME, adjective.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for adjective in @adjectives
      puts adjective.getCode().value
      puts adjective.getValue().value
    end
  end
end
