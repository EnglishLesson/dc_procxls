require_relative '../model/rulesn'

class RulesNCtrl
  def initialize
    @rulesns = Array.new
  end

  def extractData(sheets)
    for row in sheets
      rulesNModel = RulesNModel.new
      next if row.index_in_collection == 0
      rulesNModel.setCode(row[MdSheet::RulesNSheet::IDX_CODE])
      rulesNModel.setCodeRule(row[MdSheet::RulesNSheet::IDX_RULE])
      rulesNModel.setCodeNoon(row[MdSheet::RulesNSheet::IDX_NOON])
      @rulesns.push(rulesNModel)
    end
  end

  def showDataXls()
    for rulesn in @rulesns
      puts rulesn.getCode().value
      puts rulesn.getCodeRule().value
      puts rulesn.getCodeNoon().value
    end
  end
end
