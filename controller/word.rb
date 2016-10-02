require_relative '../model/word'

class WordCtrl
  def initialize
    @words = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 || (row[MdSheet::WordSheet::IDX_CODE] == nil ||
        row[MdSheet::WordSheet::IDX_CODE].value == nil)

      wordModel = WordModel.new
      wordModel.setCode(row[MdSheet::WordSheet::IDX_CODE])
      wordModel.setValue(row[MdSheet::WordSheet::IDX_VALUE])
      @words.push(wordModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()

    for word in @words
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(word.getCode().value)
      value = word.getValue().value
      params = [code, value]

      MdDb::RunDB.persistData(MdSheet::WordSheet::NAME, word.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for word in @words
      puts word.getCode().value
      puts word.getValue().value
    end
  end
end
