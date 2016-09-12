class Entity
  def getCode
    @code
  end

  def setCode(code)
    @code = code
  end

  def getValue
    @value
  end

  def setValue(value)
    @value = value
  end

  def to_s
    puts "#{@code},#{@value}"
  end
end
