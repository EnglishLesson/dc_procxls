require_relative 'rulesdefault'

class RulesNNModel < RulesDefault
  def getNounId
    @nounId
  end

  def setNounId(nounId)
    @nounId = nounId
  end

  def to_s
    return "(code, id_rule, id_noun, id_exception)"
  end
end
