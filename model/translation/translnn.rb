require_relative 'transldefault'

class TranslNNModel < TranslDefault
  def getCodeNoun
    @codeNoun
  end

  def setCodeNoun(codeNoun)
    @codeNoun = codeNoun
  end
end
