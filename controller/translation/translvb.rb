require_relative '../../model/translation/translvb'

class TranslVBCtrl
  def initialize
    @translvbs = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::TranslVBSheet::IDX_CODE] == nil || row[MdSheet::TranslVBSheet::IDX_CODE].value == nil) ||
      (row[MdSheet::TranslVBSheet::IDX_CODE_TRANSLATION] == nil || row[MdSheet::TranslVBSheet::IDX_CODE_TRANSLATION].value == nil) ||
      (row[MdSheet::TranslVBSheet::IDX_CODE_VERB] == nil || row[MdSheet::TranslVBSheet::IDX_CODE_VERB].value == nil)

      translVBModel = TranslVBModel.new
      translVBModel.setCode(row[MdSheet::TranslVBSheet::IDX_CODE])

      translationId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::TranslationSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslVBSheet::IDX_CODE_TRANSLATION].value()))
      translVBModel.setTranslationId(translationId)

      verbId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::VerbSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslVBSheet::IDX_CODE_VERB].value()))
      translVBModel.setVerbId(verbId)

      @translvbs.push(translVBModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    MdDb::RunDB.connect()

    for translvb in @translvbs
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(translvb.getCode().value)
      params = [code, translvb.getTranslationId(), translvb.getVerbId()]

      MdDb::RunDB.persistData(MdSheet::TranslVBSheet::NAME, translvb.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for translvb in @translvbs
      puts translvb.getCode().value
      puts translvb.getTranslationId().value
      puts translvb.getVerbId().value
    end
  end
end
