require_relative 'entity'


class QuestionnaireModel < Entity
  def getQuestionId
    @questionId
  end

  def setQuestionId(questionId)
    @questionId = questionId
  end

  def getAnswerId
    @answerId
  end

  def setAnswerId(answerId)
    @answerId = answerId
  end

  def to_s
    return "(code, id_question, id_answer)"
  end
end
