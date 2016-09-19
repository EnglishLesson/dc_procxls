require_relative 'instance'
require_relative 'dbutil'

module MdDb
  class RunDB
    INSTANCE = Instance.new

    def self.connect
      INSTANCE.connectDB('192.168.43.10', 5432, 'impdb', 'imprt', 'AvdWe&sd#')
    end

    def self.persistData(tableName, columns, params)
      INSTANCE.persistData(tableName, columns, params)
    end

    def self.closeConnection()
      INSTANCE.closeConnection()
    end
  end

  class DBUtil
    INSTANCE = DbUtil.new
  end
end
