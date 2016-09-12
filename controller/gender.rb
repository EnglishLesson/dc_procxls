require_relative '../model/gender'

class GenderCtrl
  def initialize
    @genders = Array.new
  end

  def extractData(sheets)
    for row in sheets
      genderModel = GenderModel.new
      next if row.index_in_collection == 0
      genderModel.setCode(row[MdSheet::GenderSheet::IDX_CODE])
      genderModel.setValue(row[MdSheet::GenderSheet::IDX_VALUE])
      @genders.push(genderModel)
    end
  end

  def showDataXls()
    for gender in @genders
      puts gender.getCode().value
      puts gender.getValue().value
    end
  end
end
