class DbUtil
  def getCodeFormat(code)
    if (code.instance_of? String)
       return '\\\x'.concat(code)
    else
      return '\\\x'.concat(code.to_i.to_s)
    end
  end

  def getIdDb(name, code)
    return MdDb::RunDB.select(name, 'id', "code = '#{code}'")
  end
end
