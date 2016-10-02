require_relative 'rulesdefault'

class RulesWDModel < RulesDefault
  def getWordId
    @wordId
  end

  def setWordId(wordId)
    @wordId = wordId
  end

  def to_s
    return "(code, id_rule, id_word)"
  end
end
