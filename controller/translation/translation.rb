require_relative '../../model/translation/translation'
require_relative '../../model/gender'


class TranslationCtrl
  def initialize
    @translations = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 || row[MdSheet::TranslationSheet::IDX_CODE] == nil ||
        row[MdSheet::TranslationSheet::IDX_VALUE] == nil

      translationModel = TranslationModel.new
      translationModel.setCode(row[MdSheet::TranslationSheet::IDX_CODE])
      translationModel.setValue(row[MdSheet::TranslationSheet::IDX_VALUE])
      codeGender = getIdDb(MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::TranslationSheet::IDX_CODE_GENDER].value()))
      puts codeGender
      translationModel.setCodeGender(codeGender)
      @translations.push(translationModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def getIdDb(code)
    return MdDb::RunDB.select(MdSheet::GenderSheet::NAME, 'id', "code = '".concat(code).concat("'"))
  end

  def persistData()
    for translation in @translations

      code = MdDb::DBUtil::INSTANCE.getCodeFormat(translation.getCode().value)
      val  = MdDb::DBUtil::INSTANCE.getStringFormat(translation.getValue().value)
      codeGender = translation.getCodeGender()
      params = [code, val, codeGender]

      MdDb::RunDB.connect()
      MdDb::RunDB.persistData(MdSheet::TranslationSheet::NAME, translation.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for translation in @translations
      puts translation.getCode().value
      puts translation.getValue().value
      puts translation.getCodeGender().value
      puts translation.getId()
    end
  end
end
