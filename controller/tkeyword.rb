require_relative '../model/tkeyword'

class TKeywordCtrl
  def initialize
    @tkeywords = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 ||
        (row[MdSheet::TKeywordSheet::IDX_CODE] == nil || row[MdSheet::TKeywordSheet::IDX_CODE].value == nil) ||
        (row[MdSheet::TKeywordSheet::IDX_NAME] == nil || row[MdSheet::TKeywordSheet::IDX_NAME].value == nil)

      tkeywordModel = TKeywordModel.new
      tkeywordModel.setCode(row[MdSheet::TKeywordSheet::IDX_CODE])
      tkeywordModel.setName(row[MdSheet::TKeywordSheet::IDX_NAME])
      @tkeywords.push(tkeywordModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()

    for tkeyword in @tkeywords
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(tkeyword.getCode().value)
      name  = tkeyword.getName().value
      params = [code, name]

      MdDb::RunDB.persistData(MdSheet::TKeywordSheet::NAME, tkeyword.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for tkeyword in @tkeywords
      puts tkeyword.getCode().value
      puts tkeyword.getName().value
    end
  end
end
