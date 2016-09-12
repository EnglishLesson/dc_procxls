require_relative '../model/keyword'

class KeywordCtrl
  def initialize
    @keywords = Array.new
  end

  def extractData(sheets)
    for row in sheets
      keywordModel = KeywordModel.new
      next if row.index_in_collection == 0
      keywordModel.setCode(row[MdSheet::KeywordSheet::IDX_CODE])
      keywordModel.setValue(row[MdSheet::KeywordSheet::IDX_VALUE])
      @keywords.push(keywordModel)
    end
  end

  def showDataXls()
    for keyword in @keywords
      puts keyword.getCode().value
      puts keyword.getValue().value
    end
  end
end
