require_relative '../../model/translation/translnn'

class TranslNNCtrl
  def initialize
    @translnns = Array.new
  end

  def extractData(sheets)
    for row in sheets
      translNNModel = TranslNNModel.new
      next if row.index_in_collection == 0
      translNNModel.setCode(row[MdSheet::TranslNNSheet::IDX_CODE])
      translNNModel.setTranslation(row[MdSheet::TranslNNSheet::IDX_CODE_TRANSLATION])
      translNNModel.setCodeKeyword(row[MdSheet::TranslNNSheet::IDX_CODE_NOUN])
      @translnns.push(translNNModel)
    end
  end

  def showDataXls()
    for translnn in @translnns
      puts translnn.getCode().value
      puts translnn.getCodeTranslation().value
      puts translnn.getCodeNoun().value
    end
  end
end
