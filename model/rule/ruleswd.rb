require_relative 'rulesdefault'

class RulesWDModel < RulesDefault
  def getCodeWord
    @codeWord
  end

  def setCodeWord(codeWord)
    @codeWord = codeWord
  end
end
