require_relative '../model/noun'

class NounCtrl
  def initialize
    @nouns = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::NounSheet::IDX_CODE] == nil || row[MdSheet::NounSheet::IDX_CODE].value == nil) ||
      (row[MdSheet::NounSheet::IDX_VALUE] == nil || row[MdSheet::NounSheet::IDX_VALUE].value == nil)

      nounModel = NounModel.new
      nounModel.setCode(row[MdSheet::NounSheet::IDX_CODE])
      nounModel.setValue(row[MdSheet::NounSheet::IDX_VALUE])
      @nouns.push(nounModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()

    for noun in @nouns
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(noun.getCode().value)
      value = noun.getValue().value
      params = [code, value]

      MdDb::RunDB.persistData(MdSheet::NounSheet::NAME, noun.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for noun in @nouns
      puts noun.getCode().value
      puts noun.getValue().value
    end
  end
end
