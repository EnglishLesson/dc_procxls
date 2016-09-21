require_relative '../../model/translation/translpp'

class TranslPPCtrl
  def initialize
    @translpps = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 || row[MdSheet::TranslPPSheet::IDX_CODE] == nil ||
        row[MdSheet::TranslPPSheet::IDX_CODE_TRANSLATION] == nil || row[MdSheet::TranslPPSheet::IDX_CODE_PREPOSITION] == nil

      translPPModel = TranslPPModel.new
      translPPModel.setCode(row[MdSheet::TranslPPSheet::IDX_CODE])

      translationId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::TranslationSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslPPSheet::IDX_CODE_TRANSLATION].value()))
      translPPModel.setTranslationId(translationId)

      prepositionId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::PrepositionSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslPPSheet::IDX_CODE_PREPOSITION].value()))
      translPPModel.setPrepositionId(prepositionId)

      @translpps.push(translPPModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    MdDb::RunDB.connect()

    for translpp in @translpps
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(translpp.getCode().value)
      params = [code, translpp.getTranslationId(), translpp.getPrepositionId()]

      MdDb::RunDB.persistData(MdSheet::TranslPPSheet::NAME, translpp.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for translpp in @translpps
      puts translpp.getCode().value
      puts translpp.getTranslationId().value
      puts translpp.getPrepositionId().value
    end
  end
end
