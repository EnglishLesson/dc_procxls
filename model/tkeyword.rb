require_relative 'entity'

class TKeywordModel < Entity
  def getName
    @name
  end

  def setName(name)
    @name = name
  end

  def to_s
    return "(code, name)"
  end
end
