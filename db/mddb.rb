require 'pg'

class DataBase
  def connectDB
    begin
      connection = PG::Connection.new('192.168.43.10', 5432, nil, nil, 'impdb', 'imprt', 'AvdWe&sd#')
      connection.prepare("statement1", 'insert into el.twords (code, val) values ($1,$2)')
      connection.exec_prepared("statement1", [12, '{one}'])
      #puts connection.exec("insert into el.twords(id, code) values (21,'test')")
    ensure
      connection.close if connection
    end
  end
end
