require_relative '../model/verb'

class VerbCtrl
  def initialize
    @verbs = Array.new
  end

  def extractData(sheets)
    for row in sheets
      verbModel = VerbModel.new
      next if row.index_in_collection == 0
      verbModel.setCode(row[MdSheet::VerbSheet::IDX_CODE])
      verbModel.setValue(row[MdSheet::VerbSheet::IDX_VALUE])
      verbModel.setCodeTranslation(row[MdSheet::VerbSheet::IDX_TRANSLATION])
      @verbs.push(verbModel)
    end
  end

  def showDataXls()
    for verb in @verbs
      puts verb.getCode().value
      puts verb.getValue().value
      puts verb.getCodeTranslation().value
    end
  end
end
