require_relative 'rulesdefault'

class RulesVBModel < RulesDefault
  def getVerbId
    @verbId
  end

  def setVerbId(verbId)
    @verbId = verbId
  end

  def to_s
    return "(code, id_rule, id_verb, id_exception)"
  end
end
