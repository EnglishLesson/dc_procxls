require_relative '../model/number'

class NumberCtrl
  def initialize
    @numbers = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::NumberSheet::IDX_CODE] == nil || row[MdSheet::NumberSheet::IDX_CODE].value == nil) ||
      (row[MdSheet::NumberSheet::IDX_VALUE] == nil || row[MdSheet::NumberSheet::IDX_VALUE].value == nil)

      numberModel = NounModel.new
      numberModel.setCode(row[MdSheet::NumberSheet::IDX_CODE])
      numberModel.setValue(row[MdSheet::NumberSheet::IDX_VALUE])
      @numbers.push(numberModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()

    for number in @numbers
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(number.getCode().value)
      value = number.getValue().value
      params = [code, value]

      MdDb::RunDB.persistData(MdSheet::NumberSheet::NAME, number.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end


  def showDataXls()
    for number in @numbers
      puts number.getCode().value
      puts number.getValue().value
    end
  end
end
