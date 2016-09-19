require_relative 'entity'

class ExceptionModel < Entity
    def getName
      @name
    end

    def setName(name)
      @name = name
    end
end
