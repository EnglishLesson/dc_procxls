require_relative 'entity'

class KeywordModel < Entity
  def getTKeywordId
    @tkeywordId
  end

  def setTKeywordId(tkeywordId)
    @tkeywordId = tkeywordId
  end

  def to_s
    return "(code, val, id_tkeyword)"
  end
end
