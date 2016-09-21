class TranslKWModel < TranslDefault
  def getKeywordId
    @keywordId
  end

  def setKeywordId(keywordId)
    @keywordId = keywordId
  end

  def to_s
    return "(code, id_keyword, id_translation)"
  end
end
