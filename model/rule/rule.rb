require_relative '../entity'

class RuleModel < Entity
  def getName
    @name
  end

  def setName(name)
    @name = name
  end

  def to_s
    return "(code, name, val)"
  end
end
