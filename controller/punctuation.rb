require_relative '../model/punctuation'

class PunctuactionCtrl
  def initialize
    @punctuations = Array.new
  end

  def extractData(sheets)
    for row in sheets
      punctuationModel = PunctuactionModel.new
      next if row.index_in_collection == 0
      punctuationModel.setCode(row[MdSheet::PunctuactionSheet::IDX_CODE])
      punctuationModel.setValue(row[MdSheet::PunctuactionSheet::IDX_VALUE])
      @punctuations.push(punctuationModel)
    end
  end

  def showDataXls()
    for punctuation in @punctuations
      puts punctuation.getCode().value
      puts punctuation.getValue().value
    end
  end
end
