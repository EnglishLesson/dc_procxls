require_relative '../../model/rule/ruleskw'

class RulesKWCtrl
  def initialize
    @ruleskws = Array.new
  end

  def extractData(sheets)
    for row in sheets
      rulesKWModel = RulesKWModel.new
      next if row.index_in_collection == 0
      rulesKWModel.setCode(row[MdSheet::RulesKWSheet::IDX_CODE])
      rulesKWModel.setCodeRule(row[MdSheet::RulesKWSheet::IDX_CODE_RULE])
      rulesKWModel.setCodeKeyword(row[MdSheet::RulesKWSheet::IDX_CODE_KEYWORD])
      @ruleskws.push(rulesKWModel)
    end
  end

  def showDataXls()
    for ruleskw in @ruleskws
      puts ruleskw.getCode().value
      puts ruleskw.getCodeRule().value
      puts ruleskw.getCodeKeyword().value
    end
  end
end
