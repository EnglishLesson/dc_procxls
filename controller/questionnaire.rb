require_relative '../model/questionnaire'

class QuestionnaireCtrl
  def initialize
    @questionnaires = Array.new
  end

  def extractData(sheets)
    MdDb::RunDB.connect()

    for row in sheets
      next if row.index_in_collection == 0 || row[MdSheet::QuestionnaireSheet::IDX_CODE] == nil ||
        row[MdSheet::QuestionnaireSheet::IDX_CODE_QUESTION] == nil || row[MdSheet::QuestionnaireSheet::IDX_CODE_ANSWER] == nil

      questionnaireModel = QuestionnaireModel.new
      questionnaireModel.setCode(row[MdSheet::QuestionnaireSheet::IDX_CODE])

      questionId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::QuestionSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::QuestionnaireSheet::IDX_CODE_QUESTION].value()))
      questionnaireModel.setQuestionId(questionId)

      answerId = MdDb::DBUtil::INSTANCE.getIdDb(MdSheet::AnswerSheet::NAME,
        MdDb::DBUtil::INSTANCE.getCodeFormat(row[MdSheet::QuestionnaireSheet::IDX_CODE_ANSWER].value()))
      questionnaireModel.setAnswerId(answerId)

      @questionnaires.push(questionnaireModel)
    end

    MdDb::RunDB.closeConnection()
  end

  def persistData()
    MdDb::RunDB.connect()

    for questionnaire in @questionnaires
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(questionnaire.getCode().value)
      params = [code, questionnaire.getQuestionId(), questionnaire.getAnswerId()]

      MdDb::RunDB.persistData(MdSheet::QuestionnaireSheet::NAME, questionnaire.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for questionnaire in @questionnaires
      puts questionnaire.getCode().value
      puts questionnaire.getQuestionId().value
      puts questionnaire.getAnswerId().value
    end
  end
end
