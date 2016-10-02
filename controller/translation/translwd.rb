require_relative '../../model/translation/translwd'

class TranslWDCtrl
  def initialize
    @translwds = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::TranslWDSheet::IDX_CODE] == nil || row[MdSheet::TranslWDSheet::IDX_CODE].value == nil) ||
      (row[MdSheet::TranslWDSheet::IDX_CODE_TRANSLATION] == nil || row[MdSheet::TranslWDSheet::IDX_CODE_TRANSLATION].value == nil) ||
      (row[MdSheet::TranslWDSheet::IDX_CODE_WORD] == nil || row[MdSheet::TranslWDSheet::IDX_CODE_WORD].value == nil)

      translWDModel = TranslWDModel.new
      translWDModel.setCode(row[MdSheet::TranslWDSheet::IDX_CODE])

      translationId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::TranslationSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslWDSheet::IDX_CODE_TRANSLATION].value()))
      translWDModel.setTranslationId(translationId)

      wordId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::WordSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslWDSheet::IDX_CODE_WORD].value()))
      translWDModel.setWordId(wordId)

      translWDModel.setTranslationId(translationId)
      translWDModel.setWordId(wordId)
      @translwds.push(translWDModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    MdDb::RunDB.connect()

    for translwd in @translwds
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(translwd.getCode().value)
      params = [code, translwd.getTranslationId(), translwd.getWordId()]

      MdDb::RunDB.persistData(MdSheet::TranslWDSheet::NAME, translwd.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for translwd in @translwds
      puts translwd.getCode().value
      puts translwd.getTranslationId().value
      puts translwd.getWordId().value
    end
  end
end
