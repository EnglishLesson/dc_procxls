require_relative '../../model/translation/translation'

class TranslationCtrl
  def initialize
    @translations = Array.new
  end

  def extractData(sheets)
    for row in sheets
      translationModel = TranslationModel.new
      next if row.index_in_collection == 0
      translationModel.setCode(row[MdSheet::TranslationSheet::IDX_CODE])
      translationModel.setValue(row[MdSheet::TranslationSheet::IDX_VALUE])
      translationModel.setCodeGender(row[MdSheet::TranslationSheet::IDX_GENDER])
      @translations.push(translationModel)
    end
  end

  def showDataXls()
    for translation in @translations
      puts translation.getCode().value
      puts translation.getValue().value
      puts translation.getCodeGender().value
    end
  end
end
