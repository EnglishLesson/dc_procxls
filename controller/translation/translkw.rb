require_relative '../../model/translation/translkw'

class TranslKWCtrl
  def initialize
    @translkws = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::TranslKWSheet::IDX_CODE] == nil || row[MdSheet::TranslKWSheet::IDX_CODE].value == nil) ||
      (row[MdSheet::TranslKWSheet::IDX_CODE_TRANSLATION] == nil || row[MdSheet::TranslKWSheet::IDX_CODE_TRANSLATION].value == nil) ||
      (row[MdSheet::TranslKWSheet::IDX_CODE_KEYWORD] == nil || row[MdSheet::TranslKWSheet::IDX_CODE_KEYWORD].value == nil)

      translKWModel = TranslKWModel.new
      translKWModel.setCode(row[MdSheet::TranslKWSheet::IDX_CODE])

      translationId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::TranslationSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslKWSheet::IDX_CODE_TRANSLATION].value()))
      translKWModel.setTranslationId(translationId)

      keywordId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::KeywordSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslKWSheet::IDX_CODE_KEYWORD].value()))
      translKWModel.setKeywordId(keywordId)

      @translkws.push(translKWModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    MdDb::RunDB.connect()

    for translkw in @translkws
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(translkw.getCode().value)
      params = [code, translkw.getKeywordId(), translkw.getTranslationId()]

      MdDb::RunDB.persistData(MdSheet::TranslKWSheet::NAME, translkw.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for translkw in @translkws
      puts translkw.getCode().value
      puts translkw.getTranslationId().value
      puts translkw.getKeywordId().value
    end
  end
end
