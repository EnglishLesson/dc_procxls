class TranslADJModel < TranslDefault
  def getAdjectiveId
    @adjectiveId
  end

  def setAdjectiveId(adjectiveId)
    @adjectiveId = adjectiveId
  end

  def to_s
    return "(code, id_translation, id_adjective)"
  end
end
