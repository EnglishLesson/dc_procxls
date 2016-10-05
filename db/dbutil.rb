class DbUtil
  def getCodeFormat(code)
    if (code.instance_of? String)
         return validateCode(code)
    else
         return validateCode(code.to_i.to_s)
    end
  end

  def getIdDb(name, code)
    return MdDb::RunDB.select(name, 'id', "code = decode('#{code}', 'hex')")
  end

  def validateCode(code)
      if (code.length == 1)
        return "000".concat(code)
      elsif (code.length == 2)
        return "00".concat(code)
      elsif (code.length == 3)
        return "0".concat(code)
      else
        return code
      end
  end
end
