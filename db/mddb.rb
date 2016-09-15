require 'pg'

<<<<<<< HEAD
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
=======
module DATABASE
  def ConnectDB
      PG::Connection.new('192.168.43.10', 5432, nil, nil, 'impdb', 'imprt', 'AvdWe&sd#')
      puts 'Banco connectado'
>>>>>>> 1e8af8af510321e90fe14559f85d2c395ee57841
  end
end
