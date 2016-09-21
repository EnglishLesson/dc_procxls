require_relative '../../model/translation/transladj'

class TranslADJCtrl
  def initialize
    @transladjs = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 || row[MdSheet::TranslADJSheet::IDX_CODE] == nil ||
        row[MdSheet::TranslADJSheet::IDX_CODE_TRANSLATION] == nil || row[MdSheet::TranslADJSheet::IDX_CODE_ADJECTIVE] == nil

      translADJModel = TranslADJModel.new
      translADJModel.setCode(row[MdSheet::TranslADJSheet::IDX_CODE])

      translationId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::TranslationSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslADJSheet::IDX_CODE_TRANSLATION].value()))
      translADJModel.setTranslationId(translationId)

      adjectiveId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::AdjectiveSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslADJSheet::IDX_CODE_ADJECTIVE].value()))
      translADJModel.setAdjectiveId(adjectiveId)

      @transladjs.push(translADJModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    MdDb::RunDB.connect()

    for transladj in @transladjs
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(transladj.getCode().value)
      params = [code, transladj.getTranslationId(), transladj.getAdjectiveId()]

      MdDb::RunDB.persistData(MdSheet::TranslADJSheet::NAME, transladj.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for transladj in @transladjs
      puts transladj.getCode().value
      puts transladj.getTranslationId().value
      puts transladj.getAdjectiveId().value
    end
  end
end
