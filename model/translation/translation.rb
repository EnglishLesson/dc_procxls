class TranslationModel < Entity
  def getGenderId
    @genderId
  end

  def setGenderId(genderId)
    @genderId = genderId
  end

  def to_s
    return "(code, val, id_gender)"
  end
end
