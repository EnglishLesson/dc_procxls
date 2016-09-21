require_relative 'transldefault'

class TranslVBModel < TranslDefault
  def getVerbId
    @verbId
  end

  def setVerbId(verbId)
    @verbId = verbId
  end

  def to_s
    return "(code, id_translation, id_verb)"
  end
end
