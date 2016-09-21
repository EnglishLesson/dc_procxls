require_relative '../../model/translation/translpron'

class TranslPronCtrl
  def initialize
    @translprons = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 || row[MdSheet::TranslPronSheet::IDX_CODE] == nil ||
        row[MdSheet::TranslPronSheet::IDX_CODE_TRANSLATION] == nil || row[MdSheet::TranslPronSheet::IDX_CODE_PRONOUN] == nil

      translPronModel = TranslPronModel.new
      translPronModel.setCode(row[MdSheet::TranslPronSheet::IDX_CODE])

      translationId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::TranslationSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslPronSheet::IDX_CODE_TRANSLATION].value()))
      translPronModel.setTranslationId(translationId)

      pronounId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::PronounSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslPronSheet::IDX_CODE_PRONOUN].value()))
      translPronModel.setPronounId(pronounId)

      @translprons.push(translPronModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    MdDb::RunDB.connect()

    for translpron in @translprons
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(translpron.getCode().value)
      params = [code, translpron.getTranslationId(), translpron.getPronounId()]

      MdDb::RunDB.persistData(MdSheet::TranslPronSheet::NAME, translpron.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for translpron in @translprons
      puts translpron.getCode().value
      puts translpron.getTranslationId().value
      puts translpron.getPronounId().value
    end
  end
end
