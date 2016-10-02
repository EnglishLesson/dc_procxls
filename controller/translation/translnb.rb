require_relative '../../model/translation/translnb'

class TranslNBCtrl
  def initialize
    @translnbs = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::TranslNBSheet::IDX_CODE] == nil || row[MdSheet::TranslNBSheet::IDX_CODE].value == nil) ||
      (row[MdSheet::TranslNBSheet::IDX_CODE_TRANSLATION] == nil || row[MdSheet::TranslNBSheet::IDX_CODE_TRANSLATION].value == nil) ||
      (row[MdSheet::TranslNBSheet::IDX_CODE_NUMBER] == nil || row[MdSheet::TranslNBSheet::IDX_CODE_NUMBER].value == nil)

      translNBModel = TranslNBModel.new
      translNBModel.setCode(row[MdSheet::TranslNBSheet::IDX_CODE])

      translationId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::TranslationSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslNBSheet::IDX_CODE_TRANSLATION].value()))
      translNBModel.setTranslationId(translationId)

      numberId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::NumberSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslNBSheet::IDX_CODE_NUMBER].value()))
      translNBModel.setNumberId(numberId)

      @translnbs.push(translNBModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    MdDb::RunDB.connect()

    for translnb in @translnbs
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(translnb.getCode().value)
      params = [code, translnb.getTranslationId(), translnb.getNumberId()]

      MdDb::RunDB.persistData(MdSheet::TranslNBSheet::NAME, translnb.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for translnb in @translnbs
      puts translnb.getCode().value
      puts translnb.getTranslationId().value
      puts translnb.getNumberId().value
    end
  end
end
