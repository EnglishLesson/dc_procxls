require_relative 'transldefault'

class TranslNBModel < TranslDefault
  def getNumberId
    @numberId
  end

  def setNumberId(numberId)
    @numberId = numberId
  end

  def to_s
    return "(code, id_translation, id_number)"
  end
end
