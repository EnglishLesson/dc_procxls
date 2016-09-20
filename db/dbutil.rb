class DbUtil
  def getCodeFormat(code)
    if (code.instance_of? String)
      return code
    else
      return code.to_i.to_s
    end
  end

  def getStringFormat(str)
    return '{'.concat(str).concat('}')
  end

  def getIdDb(name, code)
    return MdDb::RunDB.select(name, 'id', "code = '".concat(code).concat("'"))
  end
end
