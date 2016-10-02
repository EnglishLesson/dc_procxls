require_relative '../model/question'

class QuestionCtrl
  def initialize
    @questions = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 ||
      (row[MdSheet::QuestionSheet::IDX_CODE] == nil || row[MdSheet::QuestionSheet::IDX_CODE].value == nil) ||
      (row[MdSheet::QuestionSheet::IDX_VALUE] == nil || row[MdSheet::QuestionSheet::IDX_VALUE].value == nil)

      questionModel = QuestionModel.new
      questionModel.setCode(row[MdSheet::QuestionSheet::IDX_CODE])
      questionModel.setValue(row[MdSheet::QuestionSheet::IDX_VALUE])
      @questions.push(questionModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()

    for question in @questions
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(question.getCode().value)
      value = question.getValue().value
      params = [code, value]

      MdDb::RunDB.persistData(MdSheet::QuestionSheet::NAME, question.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for question in @questions
      puts question.getCode().value
      puts question.getValue().value
    end
  end
end
