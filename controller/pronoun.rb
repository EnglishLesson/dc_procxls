require_relative '../model/pronoun'

class PronounCtrl
  def initialize
    @pronouns = Array.new
  end

  def extractData(sheets)
    for row in sheets
      pronounModel = PronounModel.new
      next if row.index_in_collection == 0
      pronounModel.setCode(row[MdSheet::PronounSheet::IDX_CODE])
      pronounModel.setValue(row[MdSheet::PronounSheet::IDX_VALUE])
      @pronouns.push(pronounModel)
    end
  end

  def showDataXls()
    for pronoun in @pronouns
      puts pronoun.getCode().value
      puts pronoun.getValue().value
    end
  end
end
