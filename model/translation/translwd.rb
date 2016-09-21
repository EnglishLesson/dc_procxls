require_relative 'transldefault'

class TranslWDModel < TranslDefault
  def getWordId
    @wordId
  end

  def setWordId(wordId)
    @wordId = wordId
  end

  def to_s
    return "(code, id_translation, id_word)"
  end
end
