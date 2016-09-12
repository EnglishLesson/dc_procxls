require 'pg'

module DATABASE
  def ConnectDB
      PG::Connection.new('192.168.43.10', 5432, nil, nil, 'impdb', 'imprt', 'AvdWe&sd#')
      puts 'Banco connectado'
  end
end
