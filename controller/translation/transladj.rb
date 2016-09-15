require_relative '../../model/translation/transladj'

class TranslADJCtrl
  def initialize
    @transladjs = Array.new
  end

  def extractData(sheets)
    for row in sheets
      translADJModel = TranslADJModel.new
      next if row.index_in_collection == 0
      translADJModel.setCode(row[MdSheet::TranslADJSheet::IDX_CODE])
      translADJModel.setCodeTranslation(row[MdSheet::TranslADJSheet::IDX_CODE_TRANSLATION])
      translADJModel.setCodeAdjective(row[MdSheet::TranslADJSheet::IDX_CODE_ADJECTIVE])
      @transladjs.push(translADJModel)
    end
  end

  def showDataXls()
    for transladj in @transladjs
      puts transladj.getCode().value
      puts transladj.getCodeTranslation().value
      puts transladj.getCodeAdjective().value
    end
  end
end
