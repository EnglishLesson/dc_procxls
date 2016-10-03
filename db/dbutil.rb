class DbUtil
  def getCodeFormat(code)
    if (code.instance_of? String)
       return validateCode(code)
    else
      return validateCode(code.to_i.to_s)
    end
  end

  def getIdDb(name, code)
    return MdDb::RunDB.select(name, 'id', "code = decode(#{code}, 'hex')")
  end

  def validateCode(code)
    #TODO validar apenas números, ignorar letras
    if (code.length == 1)
      return "0".concat(code)
    end

    return code
  end
end
