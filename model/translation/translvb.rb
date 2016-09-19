require_relative 'transldefault'

class TranslVBModel < TranslDefault
  def getCodeVerb
    @codeVerb
  end

  def setCodeVerb(codeVerb)
    @codeVerb = codeVerb
  end
end
