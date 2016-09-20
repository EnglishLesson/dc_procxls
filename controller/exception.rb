require_relative '../model/exception'

class ExceptionCtrl
  def initialize
    @exceptions = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 || row[MdSheet::ExceptionSheet::IDX_CODE] == nil ||
        row[MdSheet::ExceptionSheet::IDX_VALUE] == nil || row[MdSheet::ExceptionSheet::IDX_NAME] == nil

      exceptionModel = ExceptionModel.new
      exceptionModel.setCode(row[MdSheet::ExceptionSheet::IDX_CODE])
      exceptionModel.setValue(row[MdSheet::ExceptionSheet::IDX_VALUE])
      exceptionModel.setName(row[MdSheet::ExceptionSheet::IDX_NAME])
      @exceptions.push(exceptionModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()

    for exception in @exceptions
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(exception.getCode().value)
      value = MdDb::DBUtil::INSTANCE.getStringFormat(exception.getValue().value)
      name = MdDb::DBUtil::INSTANCE.getStringFormat(exception.getName().value)
      params = [code, value, name]

      MdDb::RunDB.persistData(MdSheet::ExceptionSheet::NAME, exception.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for exception in @exceptions
      puts exception.getCode().value
      puts exception.getValue().value
      puts exception.getName().value
    end
  end
end
