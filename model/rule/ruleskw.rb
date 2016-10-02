require_relative 'rulesdefault'

class RulesKWModel < RulesDefault
  def getKeywordId
    @keywordId
  end

  def setKeywordId(keywordId)
    @keywordId = keywordId
  end

  def to_s
    return "(code, id_rule, id_keyword)"
  end
end
