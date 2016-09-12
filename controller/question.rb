require_relative '../model/question'

class QuestionCtrl
  def initialize
    @questions = Array.new
  end

  def extractData(sheets)
    for row in sheets
      questionModel = QuestionModel.new
      next if row.index_in_collection == 0
      questionModel.setCode(row[MdSheet::QuestionSheet::IDX_CODE])
      questionModel.setValue(row[MdSheet::QuestionSheet::IDX_VALUE])
      @questions.push(questionModel)
    end
  end

  def showDataXls()
    for question in @questions
      puts question.getCode().value
      puts question.getValue().value
    end
  end
end
