require_relative '../model/answer'

class AnswerCtrl

  def initialize
    @answers = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::AnswerSheet::IDX_CODE] == nil || row[MdSheet::AnswerSheet::IDX_CODE].value == nil)
      (row[MdSheet::AnswerSheet::IDX_VALUE] == nil || row[MdSheet::AnswerSheet::IDX_VALUE].value == nil)

      answerModel = AnswerModel.new
      answerModel.setCode(row[MdSheet::AnswerSheet::IDX_CODE])
      answerModel.setValue(row[MdSheet::AnswerSheet::IDX_VALUE])
      @answers.push(answerModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()

    for answer in @answers
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(answer.getCode().value)
      value = answer.getValue().value
      params = [code, value]

      MdDb::RunDB.persistData(MdSheet::AnswerSheet::NAME, answer.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for answer in @answers
      puts answer.getCode().value
      puts answer.getValue().value
    end
  end
end
