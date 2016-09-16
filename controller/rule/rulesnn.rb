require_relative '../../model/rule/rulesnn'

class RulesNNCtrl
  def initialize
    @rulesnns = Array.new
  end

  def extractData(sheets)
    for row in sheets
      rulesNNModel = RulesNNModel.new
      next if row.index_in_collection == 0
      rulesNNModel.setCode(row[MdSheet::RulesNNSheet::IDX_CODE])
      rulesNNModel.setCodeRule(row[MdSheet::RulesNNSheet::IDX_RULE])
      rulesNNModel.setCodeVerb(row[MdSheet::RulesNNSheet::IDX_NOUN])
      @rulesnns.push(rulesNNModel)
    end
  end

  def showDataXls()
    for rulesnn in @rulesnns
      puts rulesnn.getCode().value
      puts rulesnn.getCodeRule().value
      puts rulesnn.getCodeNoun().value
    end
  end
end
