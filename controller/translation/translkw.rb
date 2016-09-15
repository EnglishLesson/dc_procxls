require_relative '../../model/translation/translkw'

class TranslKWCtrl
  def initialize
    @translkws = Array.new
  end

  def extractData(sheets)
    for row in sheets
      translKWModel = TranslKWModel.new
      next if row.index_in_collection == 0
      translKWModel.setCode(row[MdSheet::TranslKWSheet::IDX_CODE])
      translKWModel.setTranslation(row[MdSheet::TranslKWSheet::IDX_CODE_TRANSLATION])
      translKWModel.setCodeKeyword(row[MdSheet::TranslKWSheet::IDX_CODE_KEYWORD])
      @translkws.push(translKWModel)
    end
  end

  def showDataXls()
    for translkw in @translkws
      puts translkw.getCode().value
      puts translkw.getCodeTranslation().value
      puts translkw.getCodeKeyword().value
    end
  end
end
