class CodesTModel
  def getCode
    @code
  end

  def setCode(code)
    @code = code
  end

  def getTName
    @tName
  end

  def setTName(tName)
    @tName = tName
  end

  def to_s
    return "(tname, code)"
  end
end
