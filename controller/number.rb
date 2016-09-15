require_relative '../model/number'

class NumberCtrl
  def initialize
    @numbers = Array.new
  end

  def extractData(sheets)
    for row in sheets
      numberModel = NounModel.new
      next if row.index_in_collection == 0
      numberModel.setCode(row[MdSheet::NumberSheet::IDX_CODE])
      numberModel.setValue(row[MdSheet::NumberSheet::IDX_VALUE])
      @numbers.push(numberModel)
    end
  end

  def showDataXls()
    for number in @numbers
      puts number.getCode().value
      puts number.getValue().value
    end
  end
end
