require_relative 'transldefault'

class TranslNNModel < TranslDefault
  def getNounId
    @nounId
  end

  def setNounId(nounId)
    @nounId = nounId
  end

  def to_s
    return "(code, id_translation, id_noun)"
  end
end
