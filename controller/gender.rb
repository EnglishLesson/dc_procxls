require_relative '../model/gender'

class GenderCtrl
  def initialize
    @genders = Array.new
  end

  def extractData(sheets)
    for row in sheets
      next if row.index_in_collection == 0 || row[MdSheet::GenderSheet::IDX_VALUE] == nil ||
        row[MdSheet::GenderSheet::IDX_VALUE] == nil

      genderModel = GenderModel.new
      genderModel.setCode(row[MdSheet::GenderSheet::IDX_CODE])
      genderModel.setValue(row[MdSheet::GenderSheet::IDX_VALUE])
      @genders.push(genderModel)
    end
  end

  def persistData()
    MdDb::RunDB.connect()

    for gender in @genders
      code = MdDb::DBUtil::INSTANCE.getCodeFormat(gender.getCode().value)
      val  = MdDb::DBUtil::INSTANCE.getStringFormat(gender.getValue().value)
      params = [code, val]

      MdDb::RunDB.persistData(MdSheet::GenderSheet::NAME, gender.to_s, params)
    end

    MdDb::RunDB.closeConnection()
  end

  def showDataXls()
    for gender in @genders
      puts gender.getCode().value
      puts gender.getValue().value
    end
  end
end
