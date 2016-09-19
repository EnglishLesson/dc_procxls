require_relative '../model/questionnaire'

class QuestionnaireCtrl
  def initialize
    @questionnaires = Array.new
  end

  def extractData(sheets)
    for row in sheets
      questionnaireModel = QuestionnaireModel.new
      next if row.index_in_collection == 0
      questionnaireModel.setCode(row[MdSheet::QuestionnaireSheet::IDX_CODE])
      questionnaireModel.setCodeQuestion(row[MdSheet::QuestionnaireSheet::IDX_CODE_QUESTION])
      questionnaireModel.setCodeAnswer(row[MdSheet::QuestionnaireSheet::IDX_CODE_ANSWER])
      @questionnaires.push(questionnaireModel)
    end
  end

  def showDataXls()
    for questionnaire in @questionnaires
      puts questionnaire.getCode().value
      puts questionnaire.getCodeQuestion().value
      puts questionnaire.getCodeAnswer().value
    end
  end
end
