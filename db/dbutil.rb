class DbUtil
  def getCodeFormat(code)
    if (code.instance_of? String)
       return code
    else
      return code.to_i.to_s
    end
  end

  def getIdDb(name, code)
    return MdDb::RunDB.select(name, 'id', "code = decode(#{code}, 'hex')")
  end
end
