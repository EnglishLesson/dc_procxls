require_relative 'entity'


class QuestionnaireModel < Entity
  def getCodeQuestion
    @codeQuestion
  end

  def setCodeQuestion(codeQuestion)
    @codeQuestion = codeQuestion
  end

  def getCodeAnswer
    @codeAnswer
  end

  def setCodeAnswer(codeAnswer)
    @codeAnswer = codeAnswer
  end
end
