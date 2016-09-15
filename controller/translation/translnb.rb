require_relative '../../model/translation/translnb'

class TranslNBCtrl
  def initialize
    @translnbs = Array.new
  end

  def extractData(sheets)
    for row in sheets
      translNBModel = TranslNBModel.new
      next if row.index_in_collection == 0
      translNBModel.setCode(row[MdSheet::TranslNBSheet::IDX_CODE])
      translNBModel.setTranslation(row[MdSheet::TranslNBSheet::IDX_CODE_TRANSLATION])
      translNBModel.setCodeNumber(row[MdSheet::TranslNBSheet::IDX_CODE_NUMBER])
      @translnbs.push(translNBModel)
    end
  end

  def showDataXls()
    for translnb in @translnbs
      puts translnb.getCode().value
      puts translnb.getCodeTranslation().value
      puts translnb.getCodeNumber().value
    end
  end
end
