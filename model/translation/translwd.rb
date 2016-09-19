require_relative 'transldefault'

class TranslWDModel < TranslDefault
  def getCodeWord
    @codeWord
  end

  def setCodeWord(codeWord)
    @codeWord = codeWord
  end
end
