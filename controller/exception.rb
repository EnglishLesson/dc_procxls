require_relative '../model/exception'

class ExceptionCtrl
  def initialize
    @exceptions = Array.new
  end

  def extractData(sheets)
    for row in sheets
      exceptionModel = ExceptionModel.new
      next if row.index_in_collection == 0
      exceptionModel.setCode(row[MdSheet::ExceptionSheet::IDX_CODE])
      exceptionModel.setValue(row[MdSheet::ExceptionSheet::IDX_VALUE])
      exceptionModel.setName(row[MdSheet::ExceptionSheet::IDX_NAME])
      @exceptions.push(exceptionModel)
    end
  end

  def showDataXls()
    for exception in @exceptions
      puts exception.getCode().value
      puts exception.getValue().value
      puts exception.getName().value
    end
  end
end
