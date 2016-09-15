require_relative '../../model/translation/translpp'

class TranslPPCtrl
  def initialize
    @translpps = Array.new
  end

  def extractData(sheets)
    for row in sheets
      translPPModel = TranslPPModel.new
      next if row.index_in_collection == 0
      translPPModel.setCode(row[MdSheet::TranslPPSheet::IDX_CODE])
      translPPModel.setCodeTranslation(row[MdSheet::TranslPPSheet::IDX_CODE_TRANSLATION])
      translPPModel.setCodePreposition(row[MdSheet::TranslPPSheet::IDX_CODE_PREPOSITION])
      @translpps.push(translPPModel)
    end
  end

  def showDataXls()
    for translpp in @translpps
      puts translpp.getCode().value
      puts translpp.getCodeTranslation().value
      puts translpp.getCodePreposition().value
    end
  end
end
