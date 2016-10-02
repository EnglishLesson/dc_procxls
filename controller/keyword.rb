require_relative '../model/keyword'

class KeywordCtrl
  def initialize
    @keywords = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::KeywordSheet::IDX_CODE] == nil || row[MdSheet::KeywordSheet::IDX_CODE].value == nil) ||
      (row[MdSheet::KeywordSheet::IDX_CODE_TKEYWORD] == nil || row[MdSheet::KeywordSheet::IDX_CODE_TKEYWORD].value == nil)

      keywordModel = KeywordModel.new
      keywordModel.setCode(row[MdSheet::KeywordSheet::IDX_CODE])
      keywordModel.setValue(row[MdSheet::KeywordSheet::IDX_VALUE])

      tkeywordsId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::TKeywordSheet::NAME,
              MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::KeywordSheet::IDX_CODE_TKEYWORD].value()))
      keywordModel.setTKeywordId(tkeywordsId)

      @keywords.push(keywordModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    MdDb::RunDB.connect()

    for keyword in @keywords
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(keyword.getCode().value)
      value = keyword.getValue().value
      params = [code, value, keyword.getTKeywordId()]

      MdDb::RunDB.persistData(MdSheet::KeywordSheet::NAME, keyword.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for keyword in @keywords
      puts keyword.getCode().value
      puts keyword.getValue().value
      puts keyword.getTKeywordId()
    end
  end
end
