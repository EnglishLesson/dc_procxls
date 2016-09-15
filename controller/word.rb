require_relative '../model/word'

class WordCtrl
  def initialize
    @words = Array.new
  end

  def extractData(sheets)
    for row in sheets
      wordModel = VerbModel.new
      next if row.index_in_collection == 0
      wordModel.setCode(row[MdSheet::WordSheet::IDX_CODE])
      wordModel.setValue(row[MdSheet::WordSheet::IDX_VALUE])
      @words.push(wordModel)
    end
  end

  def showDataXls()
    for word in @words
      puts word.getCode().value
      puts word.getValue().value
    end
  end
end
