require_relative 'instance'
require_relative 'dbutil'

module MdDb
  class RunDB
    INSTANCE = Instance.new
    INSTANCE.connectDB('192.168.43.10', 5432, 'impdb', 'imprt', 'AvdWe&sd#')
  end

  class DBUtil
    INSTANCE = DbUtil.new
  end
end
