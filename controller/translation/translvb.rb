require_relative '../../model/translation/translvb'

class TranslVBCtrl
  def initialize
    @translvbs = Array.new
  end

  def extractData(sheets)
    for row in sheets
      translVBModel = TranslVBModel.new
      next if row.index_in_collection == 0
      translVBModel.setCode(row[MdSheet::TranslVBSheet::IDX_CODE])
      translVBModel.setCodeTranslation(row[MdSheet::TranslVBSheet::IDX_CODE_TRANSLATION])
      translVBModel.setCodeVerb(row[MdSheet::TranslVBSheet::IDX_CODE_VERB])
      @translvbs.push(translVBModel)
    end
  end

  def showDataXls()
    for translvb in @translvbs
      puts translvb.getCode().value
      puts translvb.getCodeTranslation().value
      puts translvb.getCodeVerb().value
    end
  end
end
