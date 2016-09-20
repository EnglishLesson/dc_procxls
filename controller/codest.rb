require_relative '../model/codest'
require_relative '../db/mddb'

class CodesTCtrl
  def initialize
    @codests = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 || row[MdSheet::CodesTSheet::IDX_CODE] == nil

      codestModel = CodesTModel.new
      codestModel.setCode(row[MdSheet::CodesTSheet::IDX_CODE])
      codestModel.setTName(row[MdSheet::CodesTSheet::IDX_TNAME])
      @codests.push(codestModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()
    
    for codest in @codests
      tName = MdDb::DBUtil::INSTANCE.getStringFormat(codest.getTName().value)
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(codest.getCode().value)
      params = [tName, code]

      MdDb::RunDB.persistData(MdSheet::CodesTSheet::NAME, codest.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for codest in @codests
      puts codest.getCode().value
      puts codest.getTName().value
    end
  end
end
