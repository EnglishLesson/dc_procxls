require_relative '../../model/translation/translnn'

class TranslNNCtrl
  def initialize
    @translnns = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 || row[MdSheet::TranslNNSheet::IDX_CODE] == nil ||
        row[MdSheet::TranslNNSheet::IDX_CODE_TRANSLATION] == nil || row[MdSheet::TranslNNSheet::IDX_CODE_NOUN] == nil

      translNNModel = TranslNNModel.new
      translNNModel.setCode(row[MdSheet::TranslNNSheet::IDX_CODE])

      translationId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::TranslationSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslNNSheet::IDX_CODE_TRANSLATION].value()))
      translNNModel.setTranslationId(translationId)

      nounId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::NounSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslNNSheet::IDX_CODE_NOUN].value()))
      translNNModel.setNounId(nounId)

      @translnns.push(translNNModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    MdDb::RunDB.connect()

    for translnn in @translnns
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(translnn.getCode().value)
      params = [code, translnn.getTranslationId(), translnn.getNounId()]

      MdDb::RunDB.persistData(MdSheet::TranslNNSheet::NAME, translnn.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for translnn in @translnns
      puts translnn.getCode().value
      puts translnn.getTranslationId().value
      puts translnn.getNounId().value
    end
  end
end
