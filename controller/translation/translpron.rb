require_relative '../../model/translation/translpron'

class TranslPronCtrl
  def initialize
    @translpron = Array.new
  end

  def extractData(sheets)
    for row in sheets
      translPronModel = TranslPronModel.new
      next if row.index_in_collection == 0
      translPronModel.setCode(row[MdSheet::TranslPronSheet::IDX_CODE])
      translPronModel.setCodeTranslation(row[MdSheet::TranslPronSheet::IDX_CODE_TRANSLATION])
      translPronModel.setCodePreposition(row[MdSheet::TranslPronSheet::IDX_CODE_PRONOUN])
      @translpron.push(translPronModel)
    end
  end

  def showDataXls()
    for translpp in @translpron
      puts translpp.getCode().value
      puts translpp.getCodeTranslation().value
      puts translpp.getCodePronoun().value
    end
  end
end
