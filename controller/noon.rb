require_relative '../model/noon'

class NoonCtrl
  def initialize
    @noons = Array.new
  end

  def extractData(sheets)
    for row in sheets
      noonModel = NoonModel.new
      next if row.index_in_collection == 0
      noonModel.setCode(row[MdSheet::NoonSheet::IDX_CODE])
      noonModel.setValue(row[MdSheet::NoonSheet::IDX_VALUE])
      @noons.push(noonModel)
    end
  end

  def showDataXls()
    for noon in @noons
      puts noon.getCode().value
      puts noon.getValue().value
    end
  end
end
