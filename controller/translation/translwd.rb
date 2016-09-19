require_relative '../../model/translation/translwd'

class TranslWDCtrl
  def initialize
    @translwds = Array.new
  end

  def extractData(sheets)
    for row in sheets
      translWDModel = TranslWDModel.new
      next if row.index_in_collection == 0
      translWDModel.setCode(row[MdSheet::TranslWDSheet::IDX_CODE])
      translWDModel.setCodeTranslation(row[MdSheet::TranslWDSheet::IDX_CODE_TRANSLATION])
      translWDModel.setCodeWord(row[MdSheet::TranslWDSheet::IDX_CODE_WORD])
      @translwds.push(translWDModel)
    end
  end

  def showDataXls()
    for translwd in @translwds
      puts translwd.getCode().value
      puts translwd.getCodeTranslation().value
      puts translwd.getCodeWord().value
    end
  end
end
