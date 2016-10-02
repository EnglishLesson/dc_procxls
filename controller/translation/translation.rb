require_relative '../../model/translation/translation'

class TranslationCtrl
  def initialize
    @translations = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::TranslationSheet::IDX_CODE] == nil || row[MdSheet::TranslationSheet::IDX_CODE].value == nil) ||
      (row[MdSheet::TranslationSheet::IDX_VALUE] == nil || row[MdSheet::TranslationSheet::IDX_VALUE].value == nil)

      translationModel = TranslationModel.new
      translationModel.setCode(row[MdSheet::TranslationSheet::IDX_CODE])
      translationModel.setValue(row[MdSheet::TranslationSheet::IDX_VALUE])

      @translations.push(translationModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    for translation in @translations

      code = MdDb::DBUtil::INSTANCE.getCodeFormat(translation.getCode().value)
      val  = translation.getValue().value
      params = [code, val]

      MdDb::RunDB.connect()
      MdDb::RunDB.persistData(MdSheet::TranslationSheet::NAME, translation.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for translation in @translations
      puts translation.getCode().value
      puts translation.getValue().value
    end
  end
end
