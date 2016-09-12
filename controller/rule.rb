require_relative '../model/rule'

class RuleCtrl
  def initialize
    @rules = Array.new
  end

  def extractData(sheets)
    for row in sheets
      punctuationModel = PunctuactionModel.new
      next if row.index_in_collection == 0
      punctuationModel.setCode(row[MdSheet::PunctuactionSheet::IDX_CODE])
      punctuationModel.setValue(row[MdSheet::PunctuactionSheet::IDX_VALUE])
      @rules.push(punctuationModel)
    end
  end

  def showDataXls()
    for punctuation in @rules
      puts punctuation.getCode().value
      puts punctuation.getValue().value
    end
  end
end
