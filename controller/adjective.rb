require_relative '../model/adjective'

class AdjectiveCtrl

  def initialize
    @adjectives = Array.new
  end

  def extractData(sheets)
    for row in sheets
      adjectiveModel = AdjectiveModel.new
      next if row.index_in_collection == 0
      adjectiveModel.setCode(row[MdSheet::AdjectiveSheet::IDX_CODE])
      adjectiveModel.setValue(row[MdSheet::AdjectiveSheet::IDX_VALUE])
      @adjectives.push(adjectiveModel)
    end
  end

  #def persistData()
  #  for adjective in @adjectives
  #    tName = MdDb::DBUtil::INSTANCE.getStringFormat(adjective.getTName().value)
  #    code = MdDb::DBUtil::INSTANCE.getCodeFormat(adjective.getCode().value)
  #    params = [tName, code]

  #    MdDb::RunDB::INSTANCE.persistData(MdSheet::AdjectiveSheet::NAME, adjective.to_s, params)
  #  end

  #  MdDb::RunDB::INSTANCE.closeConnection
  #end

  def showDataXls()
    for adjective in @adjectives
      puts adjective.getCode().value
      puts adjective.getValue().value
    end
  end
end
