require_relative '../model/pronoun'

class PronounCtrl
  def initialize
    @pronouns = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::PronounSheet::IDX_CODE] == nil || row[MdSheet::PronounSheet::IDX_CODE].value == nil) ||
      (row[MdSheet::PronounSheet::IDX_VALUE] == nil || row[MdSheet::PronounSheet::IDX_VALUE].value == nil)

      pronounModel = PronounModel.new
      pronounModel.setCode(row[MdSheet::PronounSheet::IDX_CODE])
      pronounModel.setValue(row[MdSheet::PronounSheet::IDX_VALUE])
      @pronouns.push(pronounModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()

    for pronoun in @pronouns
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(pronoun.getCode().value)
      value = pronoun.getValue().value
      params = [code, value]

      MdDb::RunDB.persistData(MdSheet::PronounSheet::NAME, pronoun.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for pronoun in @pronouns
      puts pronoun.getCode().value
      puts pronoun.getValue().value
    end
  end
end
