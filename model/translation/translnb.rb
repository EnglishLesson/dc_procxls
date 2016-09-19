require_relative 'transldefault'

class TranslNBModel < TranslDefault
  def getCodeNumber
    @codeVerb
  end

  def setCodeNumber(codeNumber)
    @codeNumber = codeNumber
  end
end
