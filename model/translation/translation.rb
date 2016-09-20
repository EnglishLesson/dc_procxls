class TranslationModel < Entity
  def getCodeGender
    @codeGender
  end

  def setCodeGender(codeGender)
    @codeGender = codeGender
  end

  def to_s
    return "(code, val, id_gender)"
  end
end
