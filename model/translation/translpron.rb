require_relative 'transldefault'

class TranslPronModel < TranslDefault
  def getCodePronoun
    @codePronoun
  end

  def setCodePronoun(codePronoun)
    @codePronoun = codePronoun
  end
end
