require_relative '../model/answer'

class AnswerCtrl

  def initialize
    @answers = Array.new
  end

  def extractData(sheets)
    for row in sheets
      answerModel = AnswerModel.new
      next if row.index_in_collection == 0
      answerModel.setCode(row[MdSheet::AnswerSheet::IDX_CODE])
      answerModel.setValue(row[MdSheet::AnswerSheet::IDX_VALUE])
      @answers.push(answerModel)
    end
  end

  def showDataXls()
    for answer in @answers
      puts answer.getCode().value
      puts answer.getValue().value
    end
  end
end
