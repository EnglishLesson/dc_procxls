require_relative 'transldefault'

class TranslPPModel < TranslDefault
  def getCodePreposition
    @codeNoun
  end

  def setCodePreposition(codePreposition)
    @codePreposition = codePreposition
  end
end
