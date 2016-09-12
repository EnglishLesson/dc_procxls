require_relative '../model/arthicle'

class ArthicleCtrl
  def initialize
    @arthicles = Array.new
  end

  def extractData(sheets)
    for row in sheets
      arthicleModel = ArthicleModel.new
      next if row.index_in_collection == 0
      arthicleModel.setCode(row[MdSheet::ArthicleSheet::IDX_CODE])
      arthicleModel.setValue(row[MdSheet::ArthicleSheet::IDX_VALUE])
      @arthicles.push(arthicleModel)
    end
  end

  def showDataXls()
    for arthicle in @arthicles
      puts arthicle.getCode().value
      puts arthicle.getValue().value
    end
  end
end
