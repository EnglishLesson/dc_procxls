require_relative 'transldefault'

class TranslPPModel < TranslDefault
  def getPrepositionId
    @prepositionId
  end

  def setPrepositionId(prepositionId)
    @prepositionId = prepositionId
  end

  def to_s
    return "(code, id_translation, id_preposition)"
  end
end
