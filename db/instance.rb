require_relative 'db'

class Instance
  def connectDB(ip, port, dbname, dbuser, passwd)
    @instance = DataBase.new(ip, port, dbname, dbuser, passwd)
  end

  def persistData(tableName, columns, values)
    @instance.insertData('el."'.concat(tableName).concat('"'), columns, values)
  end

  def closeConnection
    @instance.closeConnection
  end
end
