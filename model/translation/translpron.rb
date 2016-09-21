require_relative 'transldefault'

class TranslPronModel < TranslDefault
  def getPronounId
    @pronounId
  end

  def setPronounId(pronounId)
    @pronounId = pronounId
  end

  def to_s
    return "(code, id_translation, id_pronoun)"
  end
end
