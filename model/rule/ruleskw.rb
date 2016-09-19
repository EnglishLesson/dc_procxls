require_relative 'rulesdefault'

class RulesKWModel < RulesDefault
  def getCodeKeyword
    @codeNoun
  end

  def setCodeKeyword(codeKeyword)
    @codeKeyword = codeKeyword
  end
end
