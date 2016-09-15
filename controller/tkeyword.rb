require_relative '../model/tkeyword'

class TKeywordCtrl
  def initialize
    @tkeywords = Array.new
  end

  def extractData(sheets)
    for row in sheets
      tkeywordModel = TKeywordModel.new
      next if row.index_in_collection == 0
      tkeywordModel.setCode(row[MdSheet::TKeywordSheet::IDX_CODE])
      tkeywordModel.setValue(row[MdSheet::TKeywordSheet::IDX_VALUE])
      tkeywordModel.setName(row[MdSheet::TKeywordSheet::IDX_NAME])
      @tkeywords.push(tkeywordModel)
    end
  end

  def showDataXls()
    for tkeyword in @tkeywords
      puts tkeyword.getCode().value
      puts tkeyword.getValue().value
      puts tkeyword.getName().value
    end
  end
end
