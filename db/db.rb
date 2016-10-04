 require 'pg'

class DataBase

  def initialize(ip, port, dbname, dbuser, passwd)
    @connection = PG::Connection.new(ip, port, nil, nil, dbname, dbuser, passwd)
    @statmentCount = 0
  end

  def insertData(table, columns, values)
    params = getParams(columns)

    stName = "statement".concat(@statmentCount.to_s)

    @connection.prepare(stName, "INSERT INTO #{table} #{columns} VALUES #{params}")
    @connection.exec_prepared(stName, values)

    @statmentCount += 1
  end

  def selectData(table, column, params)
    res = @connection.exec("SELECT #{column} FROM #{table} WHERE #{params}")
    return res[0][column]
  end

  def getParams(columns)
    params = '('

    for idx in 1..columns.split(',').length
      if idx > 1
        params.concat(",")
      end

      if idx == 1
          params.concat("decode($1,'hex')")
      else
          params.concat('$'.concat(idx.to_s))
      end
    end

    params.concat(')')

    return params
  end

  def closeConnection
    @connection.close if @connection
  end
end
