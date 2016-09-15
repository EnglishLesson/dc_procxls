require_relative '../model/preposition'

class PrepositionCtrl
  def initialize
    @prepositions = Array.new
  end

  def extractData(sheets)
    for row in sheets
      prepositionModel = PrepositionModel.new
      next if row.index_in_collection == 0
      prepositionModel.setCode(row[MdSheet::PrepositionSheet::IDX_CODE])
      prepositionModel.setValue(row[MdSheet::PrepositionSheet::IDX_VALUE])
      @prepositions.push(prepositionModel)
    end
  end

  def showDataXls()
    for preposition in @prepositions
      puts preposition.getCode().value
      puts preposition.getValue().value
    end
  end
end
