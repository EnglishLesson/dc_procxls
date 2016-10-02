require_relative '../model/preposition'

class PrepositionCtrl
  def initialize
    @prepositions = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::PrepositionSheet::IDX_CODE] == nil || row[MdSheet::PrepositionSheet::IDX_CODE].value == nil) ||
      (row[MdSheet::PrepositionSheet::IDX_VALUE] == nil || row[MdSheet::PrepositionSheet::IDX_VALUE].value == nil)

      prepositionModel = PrepositionModel.new
      prepositionModel.setCode(row[MdSheet::PrepositionSheet::IDX_CODE])
      prepositionModel.setValue(row[MdSheet::PrepositionSheet::IDX_VALUE])
      @prepositions.push(prepositionModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()

    for preposition in @prepositions
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(preposition.getCode().value)
      val  = preposition.getValue().value
      params = [code, val]

      MdDb::RunDB.persistData(MdSheet::PrepositionSheet::NAME, preposition.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for preposition in @prepositions
      puts preposition.getCode().value
      puts preposition.getValue().value
    end
  end
end
