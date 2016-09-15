require_relative '../model/noun'

class NounCtrl
  def initialize
    @nouns = Array.new
  end

  def extractData(sheets)
    for row in sheets
      nounModel = NounModel.new
      next if row.index_in_collection == 0
      nounModel.setCode(row[MdSheet::NounSheet::IDX_CODE])
      nounModel.setValue(row[MdSheet::NounSheet::IDX_VALUE])
      @nouns.push(nounModel)
    end
  end

  def showDataXls()
    for noun in @nouns
      puts noun.getCode().value
      puts noun.getValue().value
    end
  end
end
